server '192.241.138.213', :app, :web, :db, :primary => true
set :deploy_to, "/home/deploy/apps/livrodaclasse"
set :branch, '7letras'
set(:rails_env) { "#{stage}" }
