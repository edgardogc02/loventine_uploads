set :monit_password, ask('Monit Password=> ')

namespace :monit do
  desc 'Install Monit'
  task :install do
    on roles(:web) do
      execute 'sudo apt-get -y install monit'
    end
  end

  desc 'Setup all Monit configuration'
  task :setup do
    on roles(:web) do
      monit_config 'monitrc', '/etc/monit/monitrc'
      monit_config 'nginx'
      monit_config 'unicorn'
      monit_config 'redis'
      monit_config 'sidekiq'
    end
  end

  %w(start stop restart syntax reload).each do |command|
    desc "Run Monit #{command} script"
    task command do
      on roles(:web) do
        execute "sudo service monit #{command}"
      end
    end
  end

end

def monit_config(name, destination = nil)
  destination ||= "/etc/monit/conf.d/#{name}.conf"
  template "monit/#{name}.erb", "/tmp/monit_#{name}"
  execute "sudo mv /tmp/monit_#{name} #{destination}"
  execute "sudo chown root #{destination}"
  execute "sudo chmod 600 #{destination}"
end