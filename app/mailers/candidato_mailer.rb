class CandidatoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidato_mailer.editar_inscricao.subject
  #
  def editar_inscricao(candidato)
    @candidato = candidato
    mail to: candidato.email, subject: "Inscrição no Processo Seletivo"
  end
end
