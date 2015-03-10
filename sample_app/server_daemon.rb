require 'daemons'

daemon = Daemons.run('sample_app/app.rb', 
  app_name: 'sinatra', 
  dir_mode: :script, 
  dir: '../tmp/pids')