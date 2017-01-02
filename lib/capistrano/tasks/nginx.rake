namespace :nginx do
  desc 'Install latest stable release of nginx'
  task :install do
    on roles(:web) do
      execute 'sudo add-apt-repository ppa:nginx/stable'
      execute 'sudo apt-get -y update'
      execute 'sudo apt-get -y install nginx'
    end
  end
  # after :install, 'nginx:install'

  desc 'Setup nginx configuration for this application'
  task :setup do
    on roles(:web) do
      template 'nginx/nginx.conf.erb', '/tmp/nginx.conf'
      execute 'sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf'
      template 'nginx/nginx_unicorn.erb', '/tmp/nginx_conf'
      execute "sudo mv /tmp/nginx_conf /etc/nginx/sites-available/#{fetch(:nginx_name)}"
      execute 'sudo rm -f /etc/nginx/sites-enabled/default'
      execute "sudo ln -sf /etc/nginx/sites-available/#{fetch(:nginx_name)} /etc/nginx/sites-enabled/#{fetch(:nginx_name)}"

      invoke 'nginx:restart'
    end
  end
  # after :setup, 'nginx:setup'

  %w(start stop restart).each do |command|
    desc "#{command} nginx"
    task command do
      on roles(:web) do
        execute "sudo service nginx #{command}"
      end
    end
  end
end