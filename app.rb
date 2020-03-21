require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/database'

Dir["./app/services/**/*.rb"].each {|file| require file }
class App < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/webhook' do
    request.body.rewind
    result = JSON.parse(request.body.read)["queryResult"]
    
    sentence = result["parameters"]["sentence"]
    action = result["action"]

    response = InterpretService.new(action, sentence).call

    #response = TranslateService.new(sentence).call
 
    content_type :json, charset: 'utf-8'
    {
      "fulfillmentText": response,
      "payload": {
        "telegram": {
          "text": response,
          "parse_mode": "Markdown"
        }
      }
    }.to_json
  end

end