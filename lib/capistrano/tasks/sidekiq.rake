namespace :sidekiq do
  desc 'Setup sidekiq initializer and app configuration'
  task :setup do
    on roles(:app) do
      template 'sidekiq_init.erb', '/tmp/sidekiq_init'
      execute 'chmod +x /tmp/sidekiq_init'
      execute "sudo mv /tmp/sidekiq_init /etc/init.d/#{fetch(:sidekiq_service_name)}"
      execute "sudo update-rc.d -f #{fetch(:sidekiq_service_name)} defaults"
    end
  end
end