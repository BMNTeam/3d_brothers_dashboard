View = require 'views/base/view'

module.exports = class NotificationView extends View
  template: require './templates/notification'
  noWrap: true

  render: ->
    super
    @$('.notification-ago').timeago()
