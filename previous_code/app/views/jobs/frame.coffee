View = require 'views/base/view'

module.exports = class FrameView extends View
  tagName: 'tr'
  template: require './templates/frame'
