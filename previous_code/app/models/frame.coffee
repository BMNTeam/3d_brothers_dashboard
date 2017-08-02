Model = require 'models/base/model'

module.exports = class Frame extends Model
  serialize: ->
    data = super
    data.job_id = @collection.job.get 'id'
    data


