namespace :redis do
  desc 'Install latest stable release of redis'
  task :install do
    on roles(:jobs) do
      execute 'sudo apt-get -y install redis-server'
    end
  end
  after :install, 'redis:install'

  desc 'Setup redis configuration for this application'
  task :setup do
    on roles(:app) do
      restart
    end
  end
  after :setup, 'redis:setup'

  %w(start stop restart).each do |command|
    desc "#{command} redis-server"
    task command do
      on roles(:app) do
        execute "sudo service redis-server #{command}"
      end
    end
  end
end