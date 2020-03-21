class InterpretService
  def initialize(action, sentence)
    @action = action
    @sentence = sentence
  end

  def call
    case @action
    when "translate_to_english"
      TranslateEnglishService.new(sentence: @sentence).call
    when "translate_to_portuguese"
      TranslatePortugueseService.new(sentence: @sentence).call
    else
      "Não compreendi o seu desejo"
    end
  end

end