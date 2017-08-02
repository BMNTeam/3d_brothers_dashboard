MainController = require 'controllers/main'
Packages = require 'models/packages'
PackagesView = require 'views/packages/packages'

module.exports = class PackagesController extends MainController
  list: ->
    @packages = new Packages
    @packages.fetch
      success: =>
        @view = new PackagesView collection: @packages
