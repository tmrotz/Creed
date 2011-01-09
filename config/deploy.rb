
set :application, "Creed"
set :repository,  "git@github.com:tmrotz/Creed.git"

set :scm, "git"
set :branch, "master"

set :user, "trconsul"

set :domain, "trconsulting.railsplayground.net"

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/trconsul/Creed"
set :deploy_via, :remote_cache
set :use_sudo, false
#set :group_writable, false
set :scm_verbose, true
default_run_options[:pty] = true

namespace :deploy do
  task :restart do
    run "touch ~/Creed/current/tmp/restart.txt"
    run "ln -s ~/Creed/current/public ~/public_html"
    run "chmod 755 ~/Creed/current/public -R"
  end
end
