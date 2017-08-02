Job = require 'models/job'
Packages = require 'models/packages'
View = require 'views/base/view'
mediator = require 'lib/mediator'
utils = require 'lib/utils'

module.exports = class JobCreateWizardView extends View
  template: require './templates/create-wizard'
  noWrap: true

  listen:
    'addedToDOM': 'initWizard'

  events:
    'change #job-details-pkg': 'pkgChanged'
    'change #job-details-scene': 'sceneChanged'
    'input #job-details-frames': 'checkCanSingleFrame'
    'click .wizard-prev-step-btn': 'prevStep'
    'submit #create-wizard-details': 'createJob'

  initWizard: ->
    @wizard = @$('.wizard')
    @wizard.pixelWizard()
    @$('#create-wizard-details').validate
      focusInvalid: true
      rules:
        frames:
          frames: true

    # Dispose of the view when the wizard is closed
    @$el.modal().on 'hidden.bs.modal', =>
        @dispose()

    # FIXME: don't load all packages, use autocomplete dropdown
    # Load packages
    pkgList = @$('#job-details-pkg')
    @packages = new Packages
      disablePagination: true
      filters:
        status: 'ready'
    @packages.fetch
      success: =>
        for pkg in @packages.models
          pkgList.append $('<option/>',
            value: pkg.get('id')
            text : pkg.get('name')
          )
        pkgList.prop 'disabled', false

  nextStep: (event) ->
    event.preventDefault()
    form = event.target
    if $(form).valid()
      @wizard.pixelWizard('nextStep')

  prevStep: ->
    @wizard.pixelWizard('prevStep')

  pkgChanged: ->
    sceneList = @$('#job-details-scene')
    sceneList.children('option').slice(1).remove()
    cameraList = @$('#job-details-camera')
    cameraList.children('option').slice(1).remove()

    pkgID = parseInt @$('#job-details-pkg').val()
    if not pkgID
      sceneList.prop 'disabled', true
      cameraList.prop 'disabled', true
      return

    @package = @packages.get pkgID
    @scenes = @package.scenes()
    @scenes.fetch
      success: =>
        if @scenes.models.length == 0
          return

        for scene in @scenes.models
          sceneList.append $('<option/>',
            value: scene.get 'path'
            text: scene.toString()
          )
        sceneList.prop 'disabled', false

    @scene = null
    @checkCanSingleFrame()

  sceneChanged: ->
    cameraList = @$('#job-details-camera')
    cameraList.children('option').slice(1).remove()

    scenePath = @$('#job-details-scene').val()
    @scene = @scenes.find (scene) -> scene.get('path') == scenePath
    if not @scene
      cameraList.prop 'disable', true
      return

    @cameras = @scene.get('cameras')
    if not @cameras or @cameras.length == 0
      return

    for camera in @cameras
      cameraList.append $('<option/>',
        value: camera
        text: camera
      )
    cameraList.prop 'disabled', false

    @checkCanSingleFrame()

  checkCanSingleFrame: utils.debounce 250, ->
    frames = utils.parseFrames @$('#job-details-frames').val()
    should_sfr = frames.length == 1
    can_sfr = @scene and @scene.get('options').can_sfr
    will_sfr = can_sfr and should_sfr

    @$('#job-details-sfr').prop
      disabled: not will_sfr
      checked: will_sfr

  createJob: (event) ->
    event.preventDefault()
    form = event.target
    if not $(form).valid()
      return

    # Disable submit button
    @$('.wizard-start-btn').prop 'disabled', true

    # Hide previous error
    @$('#job-error').addClass 'hidden'

    # Create a new package
    job = new Job
      package_id: +@$('#job-details-pkg').val()
      name: @$('#job-details-name').val()
      scene: @$('#job-details-scene').val()
      camera: @$('#job-details-camera').val()
      frames: @$('#job-details-frames').val()
      options:
        sfr: @$('#job-details-sfr').is(':checked')
      status: 'queued'
    job.save {},
      success: (job) => @$el.modal('hide')
      error: @createError

  createError: (pkg, resp) =>
    @$('.wizard-start-btn').prop 'disabled', false

    try
      error = JSON.parse(resp.responseText).error
    catch
      error = "something bad happened"
    errorMessage = error.charAt(0).toUpperCase() + error.slice(1)
    @$('#job-error .alert .message').text errorMessage
    @$('#job-error').removeClass 'hidden'

