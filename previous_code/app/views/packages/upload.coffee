CollectionView = require 'views/base/collection-view'
PackageCreateWizardView = require 'views/packages/create-wizard'

module.exports = class UploadView extends CollectionView
  id: 'package-view'
  region: 'content'
  template: require './templates/packages'

  events:
    'click .pkg-create': 'create'

  create: ->
    if (@createWizard)
      @removeSubview 'createWizard'

    @createWizard = new PackageCreateWizardView container: '#package-view'
    @subview 'createWizard', @createWizard
