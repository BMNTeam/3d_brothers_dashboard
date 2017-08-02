Application = require 'application'
routes = require 'routes'

# Include for side effects
require 'lib/extras'

# Initialize the application on DOM ready event.
jQuery ->
  jQuery.ajaxSetup
    cache: false

  # enable CORS
  jQuery.ajaxPrefilter (options, originalOptions, jqXHR) ->
    options.crossDomain = crossDomain: true
    options.xhrFields = withCredentials: true

  new Application
    title: 'CGIFarm'
    controllerSuffix: ''
    routes: routes

