Package = require 'models/package'
Upload = require 'models/upload'
View = require 'views/base/view'
globs = require 'lib/globs'
mediator = require 'lib/mediator'

module.exports = class PackageInfoView extends View
  template: require './templates/info'
  noWrap: true

  listen:
    'addedToDOM': 'initView'

  events:
    'change #pkg-info-scene': 'sceneChanged'

  initView: ->
    @$el.modal
      show: true

    @$el.modal().on 'hidden.bs.modal', =>
        @dispose()

    sceneList = @$('#pkg-info-scene')
    sceneList.children('option').slice(1).remove()

    @logs = @model.logs()
    @logs.fetch
      success: =>
        if @logs.models.length == 0
          sceneList.children('option').remove()
          sceneList.append $('<option/>',
            text: 'Package has no scenes'
          )
          return

        sceneList.children('option').slice(1).remove()
        for scene in @logs.models
          sceneList.append $('<option/>',
            text: scene.get 'scene'
          )
        sceneList.prop 'disabled', false

  sceneChanged: (event) ->
    table = @$('#pkg-scene-entries')
    table.children().remove()

    index = @$('#pkg-info-scene option:selected').index()
    if index <= 0
      return

    log = @logs.at index-1
    entries = log.get 'entries'

    for entry in entries
      td = $('<td>').text entry.message.charAt(0).toUpperCase() + entry.message.slice(1)

      switch entry.level
        when 'warning' then td.addClass 'warning'
        when 'error' then td.addClass 'danger'
        when 'info' then td.addClass 'info'


      table.append $('<tr>').append td

  close: ->
    event.preventDefault()
    @$el.modal('hide')
