Model = require 'models/base/model'
globs = require 'lib/globs'

module.exports = class Collection extends Chaplin.Collection
  # Use the project base model per default, not Chaplin.Model
  model: Model

  sync: (method, model, options) ->
    url = options.url or _.result model, 'url'
    options.url = globs.baseUrl + url

    return super method, model, options

