PaginatedCollection = require 'models/base/paginated-collection'
Frame = require 'models/frame'

module.exports = class Frames extends PaginatedCollection
  model: Frame

  url: -> @job.url() + '/frames'

  initialize: (models, options) ->
    super

    if not options?.job
      throw new Exception 'No job provided for frames'
    @job = options.job
    @listenTo @job, 'change', -> @fetch()
