# Preview all emails at http://localhost:3000/rails/mailers/candidato_mailer
class CandidatoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/candidato_mailer/editar_inscricao
  def editar_inscricao
  	c = Candidato.last
    CandidatoMailer.editar_inscricao(c)
  end

end
