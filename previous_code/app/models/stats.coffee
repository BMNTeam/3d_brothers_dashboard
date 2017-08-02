Model = require 'models/base/model'

module.exports = class Stats extends Model
  url: '/users/me/stats'

  initialize: ->
    super
    # Package counter
    @subscribeEvent 'package.create', -> @inc 'packages', 1
    @subscribeEvent 'package.delete', -> @inc 'packages', -1

    # Job counters
    @subscribeEvent 'job.create', (job) ->
      @inc 'jobs', 1
      if job.status == 'queued' || job.status == 'rendering'
        @inc 'active_jobs', 1
      else if job.status == 'failed'
        @inc 'failed_jobs', 1

    @subscribeEvent 'job.update', (job) ->
      if job.status == 'queued'
        @inc 'active_jobs', 1
      else if job.status == 'completed'
        @inc 'active_jobs', -1
      else if job.status == 'failed'
        @inc 'active_jobs', -1
        @inc 'failed_jobs', 1

    @subscribeEvent 'job.delete', (job) ->
      @inc 'jobs', -1
      if job.status == 'queued' || job.status == 'rendering'
        @inc 'active_job', -1
      else if job.status == 'failed'
        @inc 'failed_jobs', -1

  inc: (stat, val) ->
    cval = @get stat
    @set stat, cval + val
