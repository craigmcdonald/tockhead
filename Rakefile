require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'daemons'

RSpec::Core::RakeTask.new

task test: :spec

task :sinatra, :opts do |t, args|  
  if args[:opts] == 'start'
    sh %{ruby sample_app/server_daemon.rb start }
  elsif args[:opts] == 'restart'
    sh %{ruby sample_app/server_daemon.rb restart }
  elsif args[:opts] ==  'stop'
    sh %{ruby sample_app/server_daemon.rb stop }
  elsif args[:opts] == 'status'
    sh %{ruby sample_app/server_daemon.rb status }
  end
end