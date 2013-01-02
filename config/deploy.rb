default_run_options[:pty] = true 

set :application, "note_mate_test"
set :repository,  "git@github.com:philngo/sample_app.git"

set :scm, :git

set :user, "deployer"
set :scm_passphrase, "deployer"
set :use_sudo, false
set :deploy_to, "/home/ubuntu/sample_app"

ssh_options[:forward_agent] = true


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ubuntu@208.76.3.97"                          # Your HTTP server, Apache/etc
role :app, "ubuntu@208.76.3.97"                          # This may be the same as your `Web` server
role :db,  "ubuntu@208.76.3.97", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
