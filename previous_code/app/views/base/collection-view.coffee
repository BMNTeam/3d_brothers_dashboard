View = require './view'

module.exports = class CollectionView extends Chaplin.CollectionView
  # Auto render templates by default
  autoRender: true

  # Auto-save `template` option passed to any view as `@template`.
  optionNames: Chaplin.View::optionNames.concat ['template']

  # This class doesn’t inherit from the application-specific View class,
  # so we need to borrow the method from the View prototype:
  getTemplateFunction: View::getTemplateFunction
