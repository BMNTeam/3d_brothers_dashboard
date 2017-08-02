View = require 'views/base/view'
utils = require 'lib/utils'

module.exports = class StatsView extends View
  template: require './templates/stats'
  noWrap: true

  listen:
    'change model': 'render'

  events:
    'click .packages': 'showPackages'
    'click .jobs': 'showJobs'
    'click .active-jobs': 'showActiveJobs'
    'click .failed-jobs': 'showFailedJobs'

  render: ->
    if @container != @$el
      @$el.remove()
    super

  showPackages: ->
    utils.redirectTo 'packages#list'

  showJobs: ->
    utils.redirectTo 'jobs#list'

  showActiveJobs: ->
    utils.redirectTo 'jobs#list', Status: 'active'

  showFailedJobs: ->
    utils.redirectTo 'jobs#list', Status: 'failed'
