Model = require 'models/base/model'
Scenes = require 'models/scenes'
Logs = require 'models/logs'

module.exports = class Package extends Model
  urlRoot: '/packages'

  initialize: ->
    super
    @subscribeEvent 'package.update', @onUpdate
    @subscribeEvent 'package.delete', @onDelete

  onUpdate: (pkg) ->
    if pkg.id != @get 'id'
      return
    @set pkg

  onDelete: (id) ->
    if id != @get 'id'
      return
    @trigger 'destroy', this, @collection, {}

  scenes: ->
    return new Scenes [],
      package: this

  logs: ->
    return new Logs [],
      package: this
