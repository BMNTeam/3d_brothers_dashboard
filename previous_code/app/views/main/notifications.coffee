CollectionView = require 'views/base/collection-view'
NotificationView = require 'views/main/notification'
Notification = require 'models/notification'

module.exports = class NotificationsView extends CollectionView
  template: require './templates/notifications'
  itemView: NotificationView
  listSelector: '.notification-list'
  fallbackSelector: '.notifications-empty'
  noWrap: true

  events:
    'click .dismiss-all': 'dismiss'

  render: ->
    super
    @$('.notification-list').slimScroll
      height: '250px'

  dismiss: ->
    jQuery.ajax
      url: _.result(@collection, 'url')
      type: 'DELETE'
      success: =>
        @collection.reset()

  toggleFallback: ->
    super

    visible = @$fallback.is(':visible')
    if @collection.length == 0
        @$('.dismiss-all').addClass 'hidden'
    else
        @$('.dismiss-all').removeClass 'hidden'
