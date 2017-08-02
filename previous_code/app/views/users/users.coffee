CollectionView = require 'views/base/collection-view'
PaginationView = require 'views/main/pagination'
UserView = require 'views/users/user'
Users = require 'models/users'

module.exports = class UsersViews extends CollectionView
  id: 'user-view'
  region: 'content'
  template: require './templates/users'
  itemView: UserView
  listSelector: '#user-list'

  events:
    'click th.user-email,th.user-credits': 'reorder'

  render: ->
    super
    @subview 'paginationView',  new PaginationView
      model: @collection.pagination
      container: @$ '#users-header .panel-heading-controls'
      containerMethod: 'replaceWith'
      className: 'panel-heading-controls'

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

  reorder: (e) ->
    $el = jQuery(e.target)
    orderBy = $el.data 'order-by'

    switch
      when $el.hasClass 'sorting'
        $el.siblings('.sorting_asc, .sorting_desc')
          .removeClass('sorting_asc sorting_desc').addClass('sorting')
        $el.removeClass('sorting').addClass('sorting_asc')
        @collection.orderBy = orderBy + ' desc'

      when $el.hasClass 'sorting_asc'
        $el.removeClass('sorting_asc').addClass('sorting_desc')
        @collection.orderBy = orderBy + ' asc'

      when $el.hasClass 'sorting_desc'
        $el.removeClass('sorting_desc').addClass('sorting')
        @collection.orderBy = null

    @collection.fetch()
