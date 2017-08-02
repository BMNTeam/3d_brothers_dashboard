globs = require 'lib/globs'

# Base model.
module.exports = class Model extends Chaplin.Model
  idAttribute: "id"

  sync: (method, model, options) ->
    url = options.url or _.result model, 'url'
    options.url = globs.baseUrl + url

    return super method, model, options
