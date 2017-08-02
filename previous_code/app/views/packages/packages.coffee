CollectionView = require 'views/base/collection-view'
PackageCreateWizardView = require 'views/packages/create-wizard'
PackageView = require 'views/packages/package'
PaginationView = require 'views/main/pagination'
globs = require 'lib/globs'

module.exports = class PackagesView extends CollectionView
  id: 'package-view'
  region: 'content'
  template: require './templates/packages'
  itemView: PackageView
  listSelector: '#pkg-list'

  events:
    'click .pkg-create': 'create'
    'click th.pkg-name,th.pkg-type,th.pkg-size': 'reorder'

  initialize: ->
    super
    @subscribeEvent 'package.create', -> @collection.fetch()

  render: ->
    super
    @subview 'paginationView',  new PaginationView
      model: @collection.pagination
      container: @$ '#pkg-header .panel-heading-controls'
      containerMethod: 'replaceWith'
      className: 'panel-heading-controls'

    # Filtering
    @$('#pkg-header .type-filter').editable
      title: 'Renderer'
      type: 'select'
      unsavedclass: null
      prepend: 'All'
      source: {value: p[0], text: p[2]} for p in globs.renderers.list
      success: (_, val) =>
        @collection.filter [['renderer', (if val == '' then null else val)]]

  create: ->
    if (@createWizard)
      @removeSubview 'createWizard'

    @createWizard = new PackageCreateWizardView container: '#package-view'
    @subview 'createWizard', @createWizard

  reorder: (e) ->
    $el = jQuery(e.target)
    orderBy = $el.data 'order-by'

    switch
      when $el.hasClass 'sorting'
        $el.siblings('.sorting_asc, .sorting_desc')
          .removeClass('sorting_asc sorting_desc').addClass('sorting')
        $el.removeClass('sorting').addClass('sorting_desc')
        @collection.orderBy = orderBy + ' asc'

      when $el.hasClass 'sorting_desc'
        $el.removeClass('sorting_desc').addClass('sorting_asc')
        @collection.orderBy = orderBy + ' desc'

      when $el.hasClass 'sorting_asc'
        $el.removeClass('sorting_asc').addClass('sorting')
        @collection.orderBy = null

    @collection.fetch()
