PackageInfoView = require 'views/packages/info'
View = require 'views/base/view'
mediator = require 'lib/mediator'

module.exports = class PackageView extends View
  tagName: 'tr'
  template: require './templates/package'

  events:
    'click .pkg-info': 'info'
    'click .pkg-remove': 'delete'

  listen:
    'change model': 'render'

  initialize: ->
    super
    @subscribeEvent 'upload.update', @onUploadUpdate

  onUploadUpdate: (upl) =>
    if upl.package_id != @model.get 'id'
      return

    @render()

  info: ->
    if (@packageInfo)
      @removeSubview 'packageInfo'

    @packageInfo = new PackageInfoView
      container: '#package-view'
      model: @model

    @subview 'packageInfo', @packageInfo

  delete: ->
    bootbox.confirm
      title: 'Please confirm'
      message: 'Deleting this package will delete all its jobs, and cannot ' +
               'be undone.<br/>Are you sure you want to continue?'
      className: 'delete-confirmation'
      callback: (result) =>
        if result
          @model.destroy()

