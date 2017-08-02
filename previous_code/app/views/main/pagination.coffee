View = require 'views/base/view'
utils = require 'lib/utils'

module.exports = class PaginationView extends View
  template: require './templates/pagination'

  listen:
    'change model': 'render'

  events:
    'click .items-per-page': 'changePerPage'
    'click .prev-page': 'prevPage'
    'click .next-page': 'nextPage'

  initialize: ->
    super

    @loading = false

  render: ->
    super

    model = @model
    @$('.page').editable
      title: 'Jump to page'
      type: 'text'
      unsavedclass: null
      value: @model.get 'page'
      display: (value) ->
        jQuery(@).text "Page #{value} of #{model.get 'totalPages'}"

      validate: (val) =>
        totalPages = @model.get 'totalPages'
        page = parseInt val
        if totalPages < page < 1
          return "Must be a number between 1 and #{totalPages}"

      success: (_, val) =>
        page = parseInt val
        @model.set 'page', page

  changePerPage: ->
    perPage = parseInt @$('.items-per-page').val()
    @model.set
      page: 1
      perPage: perPage

  prevPage: (e) ->
    if $(e.target).parent().hasClass 'disabled'
      return
    @model.set 'page', @model.get('page') - 1

  nextPage: (e) ->
    if $(e.target).parent().hasClass 'disabled'
      return
    @model.set 'page', @model.get('page') + 1
