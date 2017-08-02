View = require 'views/base/view'

# Site view is a top-level view which is bound to body.
module.exports = class MainView extends View
  id: 'main-wrapper'
  container: 'body'
  template: require './templates/main'
  regions:
    navbar: '#main-navbar'
    mainmenu: '#main-menu'
    content: '#content-wrapper'
