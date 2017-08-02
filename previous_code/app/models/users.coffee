PaginatedCollection = require 'models/base/paginated-collection'
User = require 'models/user'

module.exports = class Users extends PaginatedCollection
  model: User
  url: '/users'
