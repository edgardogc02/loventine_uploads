# config valid only for current version of Capistrano
lock '3.7.1'

set :user, 'deployer'
set :deploy_via, :remote_cache # just perform a pull when deploying.
set :use_sudo, false

set :application, 'uploads'
set :repo_url, "88.198.48.241:/repositories/#{fetch(:application)}.git"
set :branch, 'master'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, false

set :ssh_options, forward_agent: true

# Default value for :linked_files is []
custom_linked_files = %w(
  config/database.yml
  config/secrets.yml
  config/application.yml
)
set :linked_files, fetch(:linked_files, []) + custom_linked_files

# Default value for linked_dirs is []
custom_linked_dirs = %w(
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  public/system
  public/uploads
)
set :linked_dirs, fetch(:linked_dirs, []) + custom_linked_dirs

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to nil (no asset cleanup is performed)
# If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# set this to the number of versions to keep
set :keep_assets, 2

# Default value for keep_releases is 5
set :keep_releases, 5

before 'deploy:starting', 'check:revision'

after 'deploy:publishing', 'unicorn:restart'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end