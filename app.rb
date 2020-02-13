require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/database'

class App < Sinatra::Base

  get '/' do
    'Página Inicial'
  end

end