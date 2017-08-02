module.exports = (match) ->
  # Authentication
  match 'login', 'authentication#login'
  match 'logout', 'authentication#logout'

  match 'users', 'users#list'

  # Packages
  match 'packages', 'packages#list'

  # Jobs
  match 'jobs', 'jobs#list'

  # Not found
  match '*anything', '404#notfound'
