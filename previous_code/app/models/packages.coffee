PaginatedCollection = require 'models/base/paginated-collection'
Package = require 'models/package'

module.exports = class Packages extends PaginatedCollection
  model: Package
  url: '/packages'
