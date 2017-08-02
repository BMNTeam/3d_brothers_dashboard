Controller = require 'controllers/base/controller'
NotFoundView = require 'views/main/notfound'

module.exports = class NotFoundController extends Controller
  # Routes
  notfound: () ->
    # Redirect to packages
    @redirectTo 'packages#list'
