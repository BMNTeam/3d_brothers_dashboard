Package = require 'models/package'
Upload = require 'models/upload'
View = require 'views/base/view'
globs = require 'lib/globs'
mediator = require 'lib/mediator'
utils = require 'lib/utils'

module.exports = class PackageCreateWizardView extends View
  template: require './templates/create-wizard'
  noWrap: true

  listen:
    'addedToDOM': 'initWizard'
    'click #pkg-error .close': -> @$('#pkg-error').addClass 'hidden'

  events:
    'change #pkg-details-file': 'fileChanged'
    'submit #create-wizard-upload': 'createPackage'
    'click .wizard-close-btn': 'close'

  initWizard: ->
    @wizard = @$('.wizard')
    @wizard.pixelWizard()
    @$('#create-wizard-upload').validate
      focusInvalid: true
      rules:
        file:
          accept: 'application/zip,application/zip-compressed,application/x-zip-compressed'
      messages:
        file:
          required: 'Package file is required to continue'
          accept: 'Only zip files are accepted'

    @$el.modal().on 'hidden.bs.modal', =>
        @dispose()

  fileChanged: (event) ->
    filename = event.target.value.split('/').pop().split('\\').pop()


    pkgNameEl = @$('#pkg-details-name')
    if not pkgNameEl.val()
      pkgNameEl.val utils.removeExt filename


    @$('#pkg-details-filebtn').contents().filter(->
      @nodeType == 3
    ).first().replaceWith(filename)


  createPackage: (event) ->
    event.preventDefault()
    form = event.target
    if not $(form).valid()
      return

    file = @$('#pkg-details-file')[0].files[0]


    # Disable submit button
    @$('.wizard-start-btn').prop 'disabled', true

    # Hide previous error
    @$('#pkg-error').addClass 'hidden'

    # Create a new package
    pkg = new Package
      name: @$('#pkg-details-name').val()
    pkg.save {},
      success: @createSuccess
      error: @createError

  createError: (pkg, resp) =>
    @$('.wizard-start-btn').prop 'disabled', false

    try
      error = JSON.parse(resp.responseText).error
    catch
      error = "something bad happened"
    errorMessage = error.charAt(0).toUpperCase() + error.slice(1)
    @$('#pkg-error .alert .message').text errorMessage
    @$('#pkg-error').removeClass 'hidden'

  createSuccess: (pkg) =>
    file = @$('#pkg-details-file')[0].files[0]
    upload = new Upload
      package_id: pkg.get('id')
      name: file.name
      size: file.size
      offset: 0

    mediator.execute 'upload', upload, file
    @wizard.pixelWizard('nextStep')

  close: (event) ->
    event.preventDefault()
    @$el.modal('hide')
