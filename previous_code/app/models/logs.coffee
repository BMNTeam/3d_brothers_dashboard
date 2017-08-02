Collection = require 'models/base/collection'
Log = require 'models/log'

module.exports = class Logs extends Collection
  model: Log

  url: -> @package.url() + '/logs'

  initialize: (models, options) ->
    super

    if not options?.package
      throw new Exception 'No package provided for logs'
    @package = options.package
