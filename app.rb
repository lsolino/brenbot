require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/database'

Dir["./app/services/**/*.rb"].each {|file| require file }
class App < Sinatra::Base

  get '/' do
    'Página Inicial'
  end

  post '/webhook' do
    request.body.rewind
    result = JSON.parse(request.body.read)["queryResult"]

    puts "RESULT >>>>>> #{result}"
    
    sentence = result["parameters"]["sentence"]

    puts "SENTENCE >>>>>> #{sentence}"
    response = TranslateService.new(sentence).call
    #response = InterpretService.call(result["action"], result["parameters"])

    puts "RESPONSE >>>>>> #{response}"
 
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