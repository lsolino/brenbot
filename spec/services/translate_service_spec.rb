require_relative './../spec_helper.rb'

describe 'TranslateService' do

  describe "#call" do
    context "Valid sentence" do
      it "Return translated sentence" do
        @sentence = "Meu nome Luan"
        response = TranslateService.new(@sentence).call
        expect(response).to match("My name is Luan")
      end
    end

    context "Invalid sentence" do
      it "Return error message" do
        @sentence = nil
        response = TranslateService.new(@sentence).call
        expect(response).to match("Não foi possível realizar a tradução. Tente novamente! ")
      end
    end
  end
end