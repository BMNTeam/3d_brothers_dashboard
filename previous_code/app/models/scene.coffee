Model = require 'models/base/model'
renderers = require('lib/globs').renderers

module.exports = class Scene extends Model
  toString: ->
    path = @get 'path'
    renderer = renderers.shortMap[@get 'renderer']
    renerer_version = renderers.version @get('renderer'), @get('renderer_version')

    "#{path} (#{renderer} #{renerer_version})"
