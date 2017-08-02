Controller = require 'controllers/base/controller'
MainMenuView = require 'views/main/main-menu'
MainView = require 'views/main/main'
NavbarView = require 'views/main/navbar'
mediator = require 'lib/mediator'
utils = require 'lib/utils'

module.exports = class MainController extends Controller
  beforeAction: (params, route) ->
    if !mediator.user
      @redirectTo 'authentication#login'
      return

    @reuse 'main', MainView
    @reuse 'mainmenu', MainMenuView
    @reuse 'navbar', NavbarView,
      model: mediator.user
    super
