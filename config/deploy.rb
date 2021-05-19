lock '~> 3.16.0'

set :application, 'myapp'
set :branch, 'main'
set :repo_url, 'git@github.com:Doyal-N/bbq.git'
set :deploy_user, 'deploy'

set :deploy_to, '/home/deploy/www/'
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/application.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'storage'

set :assets_roles, :webpack
set :assets_prefix, 'packs'

set :keep_releases, 2

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'sidekiq:restart'

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
