Controller = require 'controllers/base/controller'
globs = require 'lib/globs'
mediator = require 'lib/mediator'

# on startup, an inter-tab communication channel is established using crosstab
# if logged in, the master tab establishes a websocket connection to the
# API server and begins broadcasting the websocket events to all other tabs
# when a new master tab is chosen(because the last tab was closed), it creates
# a new websocket connection

isMasterTab = ->
  crosstab.id == crosstab.util.tabs['MASTER_TAB'].id

module.exports = class EventController extends Controller
  initialize: ->
    super

    @setupCrosstab()

    @subscribeEvent 'login', @login
    @subscribeEvent 'logout', @logout

  setupCrosstab: ->
    crosstab.util.events.on crosstab.util.eventTypes.tabPromoted, @tabPromoted
    crosstab.util.events.on 'event', @onEvent

  # if the current tab was promted to master, and we are logged in
  # establish websockte connection
  tabPromoted: =>
    if @loggedIn and isMasterTab()
      @connect()

  onEvent: (message) =>
    event = message.data
    @publishEvent event.event, event.params...

  login: ->
    @loggedIn = true
    if isMasterTab()
      @connect()

  logout: ->
    @loggedIn = false
    if isMasterTab()
      @disconnect()


  connect: ->
    # Don't conect if allready connected
    if not @loggedIn || @ws?
      return

    # Setup a new connection
    @ws = new WebSocket globs.baseUrl.replace('http', 'ws') + '/events'
    @ws.onclose = @disconnect
    @ws.onmessage = @onWebsocketMessage

    # Reset retry counter if connected
    @ws.onopen = =>
      delete @_retryTimeout

  disconnect: =>
    # Remove existing connections
    if @ws?
      @ws.close()
      delete @ws

    # we shouldn't have disconnected, reconnect
    if @loggedIn
      # compute retry timeout
      @_retryTimeout ?= 0
      @_retryTimeout += 500 + Math.random() * 500
      if @_retryTimeout > 20000
        @_retryTimeout = 20000

      # Wait between retries
      setTimeout =>
        @connect()
      , @_retryTimeout

  # broadcast websocket events to all tabs
  onWebsocketMessage: (message) =>
    try
      ev = jQuery.parseJSON message.data
    catch e

    if not ev or not ev.event
      return

    crosstab.broadcast 'event', ev
