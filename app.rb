require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/database'

Dir["./app/services/**/*.rb"].each {|file| require file }
class App < Sinatra::Base

  get '/' do
    'Página Inicial'
  end

end