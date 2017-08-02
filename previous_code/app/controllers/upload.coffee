Controller = require 'controllers/base/controller'
Uploads = require 'models/uploads'
Upload = require 'models/upload'
globs = require 'lib/globs'
mediator = require 'lib/mediator'

module.exports = class UploadController extends Controller
  initialize: ->
    super
    mediator.setHandler 'upload', @upload
    @subscribeEvent 'login', @login
    @subscribeEvent 'logout', @logout
    @subscribeEvent 'package.create', @onCreate
    @subscribeEvent 'upload.update', @onUpdate

  login: ->
    uploads = new Uploads
    uploads.fetch
      success: ->
        mediator.uploads = uploads

    # Initialize file uploader
    fudiv = jQuery '<div/>'
    @fu = fudiv.fileupload.bind fudiv
    @fu
      multipart: false
      sequentialUploads: true
      maxChunkSize: 5 * 1024 * 1024
      add: (e, data) =>
        # Check if upload is a resume
        #pkgID = data.Upload.get 'PackageID'
        #pkgUpld = @uploads.get pkgID
        #if pkgUpld
        #  data.uploadedBytes = pkgUpld.get 'Offset'

        $.blueimp.fileupload.prototype.options.add.call(fudiv, e, data)
      fail: (e, data) =>
        #console.log 'failed', arguments
        #$.blueimp.fileupload.prototype.options.fail.call(fudiv, e, data)

  logout: ->
    # Stop active downloads
    @fu 'disable'
    @fu 'destroy'

    # Remove uploads
    delete @uploads

  upload: (upl, blob) =>
    @fu 'add',
      url: globs.baseUrl + upl.url()
      files: [blob]
      Upload: upl

  onCreate: (pkg) =>
    mediator.uploads.add new Upload
      package_id: pkg.id
      user_id: pkg.id
      uploaded: 0
      total_size: 1
      created_at: pkg.created_at
      updated_at: pkg.updated_at

  onUpdate: (state) =>
    upl = mediator.uploads.get state.package_id
    if !upl
      return

    if state.offset >= state.size
      upl.remove()
      return

    upl.set state
