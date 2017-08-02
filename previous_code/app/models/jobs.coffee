PaginatedCollection = require 'models/base/paginated-collection'
Job = require 'models/job'

module.exports = class Jobs extends PaginatedCollection
  model: Job
  url: '/jobs'
