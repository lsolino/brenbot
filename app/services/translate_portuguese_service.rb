require 'rest-client'

class TranslatePortugueseService
  def initialize(sentence:)
    @sentence = sentence
  end

  def call
    return "Não foi possível realizar a tradução. Tente novamente! " if @sentence == nil

    yandex_key = ENV["YANDEX_API_KEY"]
    yandex_url = ENV["YANDEX_API_URL"]
    
    url = "#{yandex_url}?key=#{yandex_key}&text=#{@sentence}&lang=en-pt"
    request = RestClient.get url
    translated_text = JSON.parse(request.body)["text"][0]
    return translated_text
  end
end
