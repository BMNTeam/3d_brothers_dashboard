Collection = require 'models/base/collection'
Model = require 'models/base/model'

module.exports = class PaginatedCollection extends Collection
  # Use the project base model per default, not Chaplin.Model
  model: Model

  initialize: (options = {}) ->
    super options
    @filters = options.filters || {}

    if !options.disablePagination
      @pagination = new Model
        page: 1
        perPage: 10
        totalPages: 0

      @pagination.on 'change', (m) =>
        if m?.changed?.totalPages
          return
        @fetch()

  filter: (filters) ->
    for filter in filters
      [filterBy, val] = [filter[0], filter[1]]
      if val == null
        delete @filters[filterBy]
      else
        @filters[filterBy] = val

    if @pagination && @pagination.get('page') != 1
      @pagination.set 'page', 1
    else
      @fetch()

  sync: (op, col, opt={}) ->
    if op == 'read'
      params = {}
      if @pagination
        [page, perPage] = [@pagination.get('page'), @pagination.get('perPage')]
        params.offset = perPage * (page-1)
        params.limit = perPage

      if @orderBy
        params.order = @orderBy

      for filter, val of @filters
        params[filter] = val

      if !jQuery.isEmptyObject params
        opt.url = if opt.url then opt.url else _.result(this, 'url')
        opt.url += (if opt.url.indexOf('?') > -1 then '&' else '?')
        opt.url += jQuery.param params

    super op, col, opt

  parse: (response) ->
    if @pagination
      perPage = @pagination.get 'perPage'
      @pagination.set
       totalPages: Math.floor(Math.max(0, response.total - 1) / perPage) + 1
    response.list
