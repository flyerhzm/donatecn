set :application, "donatecn"
set :repository,  "git@github.com:flyerhzm/donatecn.git"
set :rails_env, :production
set :deploy_to, "/home/huangzhi/sites/donatecn.com/production"

set :scm, :git
set :deploy_via, :remote_cache
set :user, 'huangzhi'
set :use_sudo, false

role :web, "donatecn.com"
role :app, "donatecn.com"
role :db,  "donatecn.com", :primary => true

require 'bundler/capistrano'

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2-p290@donatecn.com'
set :rvm_type, :user

after "deploy:update_code", "config:init"

namespace :config do
  task :init do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/alipay.yml #{release_path}/config/alipay.yml"
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    migrate
    cleanup
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
