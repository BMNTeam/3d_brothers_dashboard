Jobs = require 'models/jobs'
JobsView = require 'views/jobs/jobs'
MainController = require 'controllers/main'

module.exports = class JobsController extends MainController
  list: (params) ->
    @jobs = new Jobs
      filters: params
    @jobs.fetch
      success: =>
        @view = new JobsView collection: @jobs
