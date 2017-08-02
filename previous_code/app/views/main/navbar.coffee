Notifications  = require 'models/notifications'
NotificationsView  = require 'views/main/notifications'
View = require 'views/base/view'

module.exports = class NavbarView extends View
  region: 'navbar'
  template: require './templates/navbar'
  containerMethod: 'replaceWith'
  noWrap: true

  events:
    'click .credits': 'reload'
    'click #main-menu-toggle': 'toggleMainMenu'

  listen:
    'change model': 'render'

  initialize: ->
    super
    # Grab existing notifications
    @notifications = new Notifications()
    @listenTo @notifications, 'sync', @changeNotifications
    @listenTo @notifications, 'reset', @changeNotifications
    @notifications.fetch()

  render: ->
    super
    # Create notification view
    @subview 'notificationsView', new NotificationsView
      container: @$ '.notifications'
      collection: @notifications

  reload: ->
    @model.fetch()

  toggleMainMenu: ->
    $('body').toggleClass('mmc')

  changeNotifications: ->
    len = @notifications.length
    @$('.notification-no').text(if len then len else '')
