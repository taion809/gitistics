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

get '/' do
    erb :index
end
