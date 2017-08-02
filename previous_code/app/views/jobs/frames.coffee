CollectionView = require 'views/base/collection-view'
FrameView = require 'views/jobs/frame'
PaginationView = require 'views/main/pagination'

module.exports = class FramesView extends CollectionView
  tagName: 'tr'
  template: require './templates/frames'

  itemView: FrameView
  listSelector: '.frame-list'

  events:
    'click th.sorting,th.sorting_asc,th.sorting_desc': 'reorder'

  render: ->
    super
    @subview 'paginationView',  new PaginationView
      model: @collection.pagination
      container: @$ '#frames-header .panel-heading-controls'
      containerMethod: 'replaceWith'
      className: 'panel-heading-controls'

  reorder: (e) ->
    $el = jQuery(e.target)
    orderBy = $el.data 'order-by'

    # Check to see if not a child table header
    if $el.parents('.frame-table > thead').length == 0
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
