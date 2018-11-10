# frozen_string_literal: true

lock '~> 3.10.0'

set :user, 'nazarchuk_dima'
server '35.198.173.10', user: fetch(:user), roles: %i[web app db]
set :application, 'd2live'
set :repo_url, 'git@github.com:DearGrenadier/d2live.git'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

append :linked_files, 'config/database.yml', 'config/application.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads'

set :rbenv_ruby, File.read('.ruby-version').strip
set :puma_workers, 1
set :puma_threads, [4, 16]
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_init_active_record, true

set :nginx_server_name, 'nazarchuk.tk'

set :whenever_environment, fetch(:stage)
