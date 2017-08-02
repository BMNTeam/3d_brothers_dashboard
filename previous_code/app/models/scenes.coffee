Collection = require 'models/base/collection'
Scene = require 'models/scene'

module.exports = class Scenes extends Collection
  model: Scene

  url: -> @package.url() + '/scenes'

  initialize: (models, options) ->
    super

    if not options?.package
      throw new Exception 'No package provided for scenes'
    @package = options.package
