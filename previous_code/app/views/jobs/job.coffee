FramesView = require 'views/jobs/frames'
View = require 'views/base/view'

module.exports = class JobView extends View
  tagName: 'tr'
  template: require './templates/job'

  listen:
    'change model': 'render'

  events:
    'click .job-frame-list': 'toggleFrames'
    'click .job-resume': 'resume'
    'click .job-suspend': 'suspend'
    'click .job-remove': 'delete'

  toggleFrames: ->
    if @subview 'framesView'
      @removeSubview 'framesView'
      @$('.job-frame-list').removeClass 'active'
      @$el.removeClass 'active'
      return

    frames = @model.frames()
    frames.fetch
      success: =>
        @subview 'framesView', new FramesView
          container: @$el
          containerMethod: 'after'
          collection: frames

    @$('.job-frame-list').addClass 'active'
    @$el.addClass 'active'

  resume: ->
    @model.resume()

  suspend: ->
    @model.suspend()

  delete: ->
    bootbox.confirm
      title: 'Please confirm'
      message: 'Deleting this job will delete all its frames, and cannot be ' +
               'undone.<br/>Are you sure you want to continue?'
      className: 'delete-confirmation'
      callback: (result) =>
        if result
          @model.destroy()
