AuthenticationController = require 'controllers/authentication'
EventController = require 'controllers/event'
UploadController = require 'controllers/upload'
mediator = require 'lib/mediator'

module.exports = class Application extends Chaplin.Application
  initialize: ->
    super

    @subscribeEvent 'router:match', @sendPageView

  # Google analytics pageview
  sendPageView: (route) ->
    ga 'send', 'pageview', "/#{route.path}"

  start: ->
    # Start the upload controller
    new UploadController
    new EventController

    # Initiate user login
    new AuthenticationController().getLoggedUser().always =>
      super
