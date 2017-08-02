# Application-specific view helpers
# http://handlebarsjs.com/#helpers
# --------------------------------
utils = require './utils'

# Try loading partials using require
Handlebars.VM.original_invokePartial = Handlebars.VM.invokePartial
Handlebars.VM.invokePartial = (partial, name, context, helpers, partials, data) ->
  unless partial
    try
      partial = require name
      partials[name] = partial

  Handlebars.VM.original_invokePartial(partial, name, context, helpers, partials, data)

register = (name, fn) ->
  Handlebars.registerHelper name, fn

# Map helpers
# -----------

# Make 'with' behave a little more mustachey.
register 'with', (context, options) ->
  if not context or Handlebars.Utils.isEmpty context
    options.inverse(this)
  else
    options.fn(context)

# Inverse for 'with'.
register 'without', (context, options) ->
  inverse = options.inverse
  options.inverse = options.fn
  options.fn = inverse
  Handlebars.helpers.with.call(this, context, options)

# Get Chaplin-declared named routes. {{url "likes#show" "105"}}
register 'url', (routeName, params..., options) ->
  utils.reverse routeName, params
