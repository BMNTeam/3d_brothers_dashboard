Stats = require 'models/stats'
StatsView = require 'views/main/stats'
View = require 'views/base/view'
mediator = require 'lib/mediator'
utils = require 'lib/utils'

module.exports = class MainMenuView extends View
  region: 'mainmenu'
  template: require './templates/main-menu'
  containerMethod: 'replaceWith'
  noWrap: true

  listen:
    'dispatcher:dispatch mediator': 'navigate'
    'login mediator': 'render'

  initialize: ->
    super
    # Get stats if not an admin
    if !mediator.user.get('admin')
      @stats = new Stats()
      @stats.fetch()

  render: ->
    super
    # Create the stats view
    if !mediator.user.get('admin')
      @subview 'statsView', new StatsView
        container: @$ '#main-menu-inner'
        model: @stats

  navigate: (controller, params, route) ->
    if !@$el
      return
    elems = @$ 'ul.navigation li'
    elems.filter('.active').removeClass('active')

    activeLink = utils.reverse route.name
    elems.filter(":has(a[href=\"#{ activeLink }\"])").addClass('active')
