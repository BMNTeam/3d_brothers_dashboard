Controller = require 'controllers/base/controller'
CurrentUser = require 'models/current-user'
LoginView = require 'views/main/login'
User = require 'models/user'
globs = require 'lib/globs'
mediator = require 'lib/mediator'
utils = require 'lib/utils'

module.exports = class AuthenticationController extends Controller
  initialize: ->
    mediator.setHandler 'login', @tryLogin
    mediator.setHandler 'logout', @doLogout
    super

  getLoggedUser: ->
    # This deferred is resolved after the user has been loaded
    done = new jQuery.Deferred

    # Try to fetch the currently logged user
    user = new CurrentUser
    user.fetch().then =>
      @loggedIn user
      done.resolve()
    , ->
      done.resolve()

    # Return the deferred
    done


  loggedIn: (user) ->
    # Persist the user to the mediator
    mediator.user = user

    # Publish login events
    @publishEvent 'login', user
    @publishEvent 'loginStatus', true

  tryLogin: (email, password, admin) =>
    jQuery.ajax
      url: globs.baseUrl + '/login'
      type: 'POST'
      contentType: 'application/json; charset=utf-8'
      dataType: 'json'
      data: JSON.stringify
        email: email
        password: password
        admin: admin

    .then (data) =>
      @loggedIn new User data
      # Redirect to the default page
      @redirectTo 'packages#list'
    , (xhr) =>
      # Try getting the error message from the failed login attempt
      msg = 'Something went wrong.'
      if xhr.responseText
        try
          msgJSON = jQuery.parseJSON xhr.responseText
          if msgJSON.error
            msg = msgJSON.error
        catch e

      # Publish the login failed events
      @publishEvent 'loginError', msg

  doLogout: () ->
    jQuery.ajax({
      url: globs.baseUrl + '/logout',
      type: 'POST'
    }).then (data) =>
      # Unpersist the user
      if mediator.user
        mediator.user.dispose()
        mediator.user = null

      @publishEvent 'logout'
      @publishEvent 'loginStatus', false
      utils.redirectTo 'authentication#login'
    , (xhr) =>
      # Try getting the error message from the failed login attempt
      msg = 'Something went wrong.'
      if xhr.responseText
        try
          msgJSON = jQuery.parseJSON xhr.responseText
          if msgJSON.error
            msg = msgJSON.error
        catch e

  # Routes
  login: () ->
    if mediator.user
      @loggedIn mediator.user
      # Redirect to the default page
      @redirectTo 'packages#list'
      return
    @view = new LoginView

  logout: ->
    @doLogout()
