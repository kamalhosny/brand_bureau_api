# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'brand_bureau_api'
set :repo_url, 'git@github.com:kamalhosny/brand_bureau_api.git'
set :deploy_to, '/home/brand_bureau_api'

set :deploy_to,       '/home/brand_bureau_api'
set :user,            'root'

set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :ssh_options,     forward_agent: true,
                      user: fetch(:user),
                      keys: %w[~/.ssh/id_rsa.pub]
set :rvm_ruby_version, '2.4.0'
set :passenger_restart_with_sudo, true

set :format,        :pretty
set :log_level,     :debug
set :keep_releases, 5

set :linked_dirs, %w[log tmp/pids tmp/cache]

append :linked_files, 'config/secrets.yml'
append :linked_files, 'config/database.yml'
append :linked_files, '.env'

namespace :deploy do
  desc 'Symlinks config files for Nginx.'
  task :nginx_symlink do
    on roles(:app) do
      execute 'rm -f /etc/nginx/sites-enabled/default'

      execute "sudo ln -nfs #{current_path}/config/nginx.rb /etc/nginx/sites-enabled/#{fetch(:domain)}"
      execute "sudo ln -nfs   /config/nginx.rb /etc/nginx/sites-available/#{fetch(:domain)}"
    end
  end

  after  :updating,     :nginx_symlink
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

namespace :logs do
  desc 'Tail application logs'
  task :tail_app do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:stage)}.log"
    end
  end
end
