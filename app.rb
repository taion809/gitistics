require 'rubygems'
require 'sinatra'
require 'erubis'
require 'bcrypt'

set :environment, :production

enable :sessions

get '/login' do
    erb :'auth/login'
end

get '/register' do
    erb :'auth/register'
end

post '/register' do
    request.body.rewind  # in case someone already read it
    puts params
end   

get '/' do
    erb :index
end
