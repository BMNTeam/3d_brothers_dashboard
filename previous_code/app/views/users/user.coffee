FramesView = require 'views/jobs/frames'
View = require 'views/base/view'

module.exports = class JobView extends View
  tagName: 'tr'
  template: require './templates/user'
