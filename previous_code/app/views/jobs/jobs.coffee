CollectionView = require 'views/base/collection-view'
JobCreateWizardView = require 'views/jobs/create-wizard'
JobView = require 'views/jobs/job'
Jobs = require 'models/jobs'
Packages = require 'models/packages'
PaginationView = require 'views/main/pagination'
globs = require 'lib/globs'


module.exports = class JobsViews extends CollectionView
  id: 'job-view'
  region: 'content'
  template: require './templates/jobs'
  itemView: JobView
  listSelector: '#job-list'

  events:
    'click .job-create': 'create'
    'click th.sorting,th.sorting_asc,th.sorting_desc': 'reorder'

  initialize: ->
    super
    @subscribeEvent 'job.create', -> @collection.fetch()
    @subscribeEvent 'job.delete', -> @collection.fetch()

  render: ->
    super
    @subview 'paginationView',  new PaginationView
      model: @collection.pagination
      container: @$ '#jobs-header .panel-heading-controls'
      containerMethod: 'replaceWith'
      className: 'panel-heading-controls'

    # Filtering
    @$('#jobs-header .status-filter').editable
      title: 'Job status'
      type: 'select'
      unsavedclass: null
      prepend: 'All'
      value: @collection.filters.status
      source: [
        {value: 'inactive', text: 'Inactive'}
        {value: 'queued', text: 'Queued'}
        {value: 'rendering', text: 'Rendering'}
        {value: 'completed', text: 'Completed'}
        {value: 'failed', text: 'Failed'}
      ]
      display: (value, sourceData) ->
        data = jQuery.fn.editableutils.itemsByValue value, sourceData
        text =
          if data.length == 0 || !data[0].value
            'All'
          else
            data[0].text
        jQuery(this).text text
      success: (_, val) =>
        @collection.filter [['status', (if val == '' then null else val)]]
    #
    # TODO: lazy load this
    @packages = new Packages
      disablePagination: true
    @packages.fetch
      success: =>
        @$('#jobs-header .package-filter').editable
          title: 'Package'
          type: 'select'
          unsavedclass: null
          prepend: 'All'
          value: @collection.filters.package_id
          source: @packages.map (pkg) ->
            value: pkg.get 'id'
            text: pkg.get 'name'

          display: (value, sourceData) ->
            data = jQuery.fn.editableutils.itemsByValue value, sourceData
            text =
              if data.length == 0 || !data[0].value
                'all packages'
              else
                data[0].text
            jQuery(this).text text

          success: (_, val) =>
            @collection.filter [['package_id', (if val == '' then null else val)]]

    @$('#jobs-header .renderer-filter').editable
      title: 'Renderer'
      type: 'select'
      unsavedclass: null
      prepend: 'Any'
      source: {value: p[0], text: p[2]} for p in globs.renderers.list
      display: (value, sourceData) ->
        data = jQuery.fn.editableutils.itemsByValue value, sourceData
        text =
          if data.length == 0 || !data[0].value
            'any renderer'
          else
            data[0].text
        jQuery(this).text text

      success: (_, val) =>
        @collection.filter [['renderer', (if val == '' then null else val)]]


  create: ->
    if (@createWizard)
      @removeSubview 'createWizard'

    @createWizard = new JobCreateWizardView container: '#job-view'
    @subview 'createWizard', @createWizard

  reorder: (e) ->
    $el = jQuery(e.target)
    orderBy = $el.data 'order-by'

    # Check to see if not a child table header
    if $el.parents('.job-table > thead').length == 0
      return

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
