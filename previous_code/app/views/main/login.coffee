View = require 'views/base/view'
mediator = require 'lib/mediator'

module.exports = class LoginView extends View
  container: 'body'
  id: 'login-view'
  template: require './templates/login'

  listen:
    'addedToDOM': 'initLogin'
    'loginError mediator': 'loginError'

  events:
    'submit #login-form': 'triggerLogin'
    'click #toggle-admin': 'toggleAdmin'

  initialize: ->
    super
    @admin = false

  initLogin: ->
    @$('#login-form').validate
      focusInvalid: true
      rules:
        email:
          email: true
          required: true
        password:
          required: true

  render: ->
    jQuery('body').addClass 'page-signin-alt'
    super

  dispose: ->
    super
    jQuery('body').removeClass 'page-signin-alt'

  toggleAdmin: ->
    @admin = !@admin
    btn = @$('#toggle-admin')
    if @admin
      btn.text 'User'
      btn.removeClass 'btn-danger'
    else
      btn.text 'Admin'
      btn.addClass 'btn-danger'


  triggerLogin: (event) ->
    @$('#login-error').addClass('hidden').text()

    event.preventDefault()
    if not @$('#login-form').valid()
      return

    # Start the login process
    [email, password] = [@$('#email').val(), @$('#password').val()]
    mediator.execute 'login', email, password, @admin

  loginError: (error) ->
    @$('#login-error').removeClass('hidden').text(error)

