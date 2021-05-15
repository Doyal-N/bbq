lock '~> 3.16.0'

set :application, 'bbq'
set :branch, 'main'
set :repo_url, 'git@github.com:Doyal-N/bbq.git'
set :deploy_user, 'deploy'

set :deploy_to, '/home/deploy/www/'
append :linked_files, 'config/master.key', 'config/database.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'storage'

set :keep_releases, 2

namespace :deploy do
  desc 'Restart app'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

after 'deploy:publishing', :restart

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
