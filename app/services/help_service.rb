class HelpService
  def self.call
    response  = "***Meus comandos*** \n\n"
    response += "help\n\n\n"
    response += "*** Para traduzir do Inglês para o Português use: ***\n\n"
    response += " - Como se diz [palavra] em português"
    response += " - Traduza [palavra] para português\n"
    response += " - O que significa [palavra]\n\n\n"
    response += "*** Para traduzir do Português para o Inglês use: ***\n\n"
    response += " - Traduza [palavra] para inglês\n"
    response += " - Como se diz [palavra] em inglês\n\n\n"
    response += "*** Dúvidas sobre mim: ***\n\n"
    response += " - Fale com meu dono @lsolino\n"
    response
  end
end