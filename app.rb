require 'rubygems'
require 'sinatra'

set :environment, :production

get '/' do
    puts "I'm here!"
end
