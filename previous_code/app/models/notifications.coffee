Collection = require 'models/base/collection'
Notification = require 'models/notification'

module.exports = class Notifications extends Collection
  model: Notification
  url: '/notification'

  initialize: ->
    super
    @subscribeEvent 'notification.create', -> @fetch()
