Frames = require 'models/frames'
Model = require 'models/base/model'

module.exports = class Job extends Model
  urlRoot: '/jobs'

  initialize: ->
    super
    @subscribeEvent 'job.update', @onUpdate
    @subscribeEvent 'job.delete', @onDelete

  onUpdate: (job) ->
    if job.id != @get 'id'
      return
    @set job

  onDelete: (job) ->
    if job.id != @get 'id'
      return
    @trigger 'destroy', this, @collection, {}

  frames: ->
    return new Frames [],
      job: this

  suspend: ->
    @save
      'status': 'inactive'
    ,
      'wait': true

  resume: ->
    @save
      'status': 'queued'
    ,
      'wait': true
