MainController = require 'controllers/main'
Users = require 'models/users'
UsersView = require 'views/users/users'

module.exports = class UsersController extends MainController
  list: ->
    @users = new Users
    @users.fetch
      success: =>
        @view = new UsersView collection: @users
