Collection = require 'models/base/collection'
Upload = require 'models/upload'
mediator = require 'lib/mediator'

module.exports = class Uploads extends Collection
  model: Upload
  url: '/users/me/uploads'
