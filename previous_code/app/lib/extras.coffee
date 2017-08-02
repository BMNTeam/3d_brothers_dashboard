utils = require 'lib/utils'

jQuery.validator.addMethod 'frames', (val, el) ->
  if @optional(el)
    return true
  frames = utils.parseFrames val
  return frames != null && frames.length > 0
, 'Invalid frame list'
