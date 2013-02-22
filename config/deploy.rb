set :application, "simples"
set :repository,  "https://github.com/benjaminharel/todos.git"
set :applicationdir, "/var/www/apps/#{application}"


set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :git_enable_submodules, 1
set :git_shallow_clone, 1
set :scm_verbose, true

set :deploy_via, :remote_cache
set :branch, fetch(:branch, "master")

role :web, "webserver.ip"                          # Your HTTP server, Apache/etc
role :app, "webserver.ip"                          # This may be the same as your `Web` server
role :db,  "webserver.ip", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
after "deploy:restart", "deploy:cleanup"
set :deploy_to, applicationdir

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end