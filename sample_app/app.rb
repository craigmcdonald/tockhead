require 'sinatra'
require 'pry'

set :run, true
set :server, 'thin'
set :bind, '127.0.0.1'
set :port, 4568

get '/' do
  if params[:code]
    dir = File.expand_path File.dirname(__FILE__)
    dir.gsub!("sample_app","")
    File.write(dir+'tmp/auth_code', params[:code])
    "Success!"
  else
    "No Code"
  end
end