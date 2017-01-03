namespace :unicorn do
  desc 'Setup Unicorn initializer and app configuration'
  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      template 'unicorn.rb.erb', fetch(:unicorn_config)
      template 'unicorn_init.erb', '/tmp/unicorn_init'
      execute 'chmod +x /tmp/unicorn_init'
      execute "sudo mv /tmp/unicorn_init /etc/init.d/unicorn_#{fetch(:unicorn_name)}"
      execute "sudo update-rc.d -f unicorn_#{fetch(:unicorn_name)} defaults"
    end
  end
  # after :setup, 'unicorn:setup'

  %w(start stop restart).each do |command|
    desc "#{command} unicorn"
    task command do
      on roles(:app) do
        execute "service unicorn_#{fetch(:unicorn_name)} #{command}"
      end
    end
  end
end