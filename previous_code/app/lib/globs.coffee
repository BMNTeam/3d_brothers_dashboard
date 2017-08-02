verbatimVersion = (version) -> version

renderers = [
  ['3dsmax', 'Autodesk 3ds Max', '3ds Max', verbatimVersion],
  ['maya', 'Autodesk Maya', 'Maya', verbatimVersion],
]

module.exports = globs =
  baseUrl: 'https://api.cgifarm.com'

  renderers:
    list: renderers
    map: new ->
      @[t[0]] = t[1] for t in renderers
      this
    shortMap: new ->
      @[t[0]] = t[2] for t in renderers
      this
    versions: new ->
      @[t[0]] = t[3] for t in renderers
      this
    version: (renderer, version) ->
      ver = globs.renderers.versions[renderer] version
      if ver == ''
        return 'unknown'
      ver
