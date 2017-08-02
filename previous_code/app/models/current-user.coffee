User = require 'models/user'

module.exports = class CurrentUser extends User
  url: '/users/me'

  initialize: ->
    super
    @subscribeEvent 'user.balance', (balance) =>
      @set 'credits', balance
