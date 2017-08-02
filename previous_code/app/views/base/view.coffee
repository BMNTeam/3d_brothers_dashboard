module.exports = class View extends Chaplin.View
  # Auto render templates by default
  autoRender: true

  # Auto-save `template` option passed to any view as `@template`.
  optionNames: Chaplin.View::optionNames.concat ['template']

  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template
