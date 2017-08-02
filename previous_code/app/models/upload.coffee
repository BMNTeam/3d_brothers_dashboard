Model = require 'models/base/model'
mediator = require 'lib/mediator'

module.exports = class Upload extends Model
  idAttribute: 'package_id'
  url: -> "/packages/#{@get 'package_id'}/upload"
