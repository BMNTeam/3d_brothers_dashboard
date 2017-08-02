# Application-specific utilities
# ------------------------------

intvRx = /^(-?\d+)(-(-?\d+)((x|step|by|every)(\d+)|)|)$/
extRx = /\.[^.]*?$/

# Delegate to Chaplin’s utils module.
utils = Chaplin.utils.beget Chaplin.utils

_.extend utils,
  markdown: window.markdown
  gravatar: (email, size) ->
    hash = md5(email)
    "//www.gravatar.com/avatar/#{hash}?s=#{size}&d=mm"


  humanSize: (size) ->
    units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
    unitIndex = 0
    while size >= 1024
      unitIndex++
      size /= 1024

    Math.round(size) + ' ' + units[unitIndex]

  humanTime: (t) ->
    units = ['s', 'm', 'h']

    if t == 0
      return '0s'

    prettyUnits = []
    for unit in units
      v = Math.floor t % 60
      t = t / 60

      if v == 0
        continue

      prettyUnits.unshift v + unit

    return prettyUnits.join ' '

  removeExtension: (filename) ->
    filename.replace /\.[^/.]+$/, ''

  parseFrames: (frames) ->
    allFrames = []
    intvs = frames.replace(/\s+/g, ',').split(',')
    for intv in intvs
      if intv == ''
        continue

      match = intv.match(intvRx)

      switch
        when !match
          return null
        when match[5]
          start = parseInt match[1]
          end = parseInt match[3]
          step = parseInt match[6]
          if start >= end
            return null
          if step > end - start
            return null
          allFrames = allFrames.concat (x for x in [start..end] by step)
        when match[3]
          start = parseInt match[1]
          end = parseInt match[3]
          if start >= end
            return null
          allFrames = allFrames.concat [start..end]
        when match[1]
          frame = parseInt match[1]
          allFrames.push parseInt match[1]
    _.uniq allFrames

  removeExt: (filename) ->
    filename.replace extRx, ''

  debounce: (delay, fn) ->
    timer = null
    ->
      ctx = @
      clearTimeout timer
      timer = setTimeout ->
        fn.apply ctx, arguments
      , delay


# Prevent creating new properties and stuff.
Object.seal? utils

module.exports = utils
