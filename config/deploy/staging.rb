# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}

server '88.99.69.71', user: 'deployer', roles: %w(web app db)

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :web, '88.99.69.71'
role :app, '88.99.69.71'
role :db, '88.99.69.71'

# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.


# Vars
set :deploy_to, "/var/www/html/#{fetch(:application)}_staging"

set :sidekiq_user, fetch(:user)
set :sidekiq_pid, "#{current_path}/tmp/pids/sidekiq.pid"
set :sidekiq_role, :app
set :sidekiq_service_name, "sidekiq_#{fetch(:application)}_staging"

set :unicorn_user, fetch(:user)
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"
set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_log, "#{shared_path}/log/unicorn.log"
set :unicorn_workers, 2
set :unicorn_name, "#{fetch(:application)}_staging"

set :nginx_name, "#{fetch(:application)}_staging"

set :sidekiq_password_location, "#{shared_path}/.sidekiq_htpasswd"

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
