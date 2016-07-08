class CadastroE < ActiveRecord::Base
    attr_accessor :edit_token
    belongs_to :cadastro_es_eventos

	before_save :downcase_email
	before_create :criar_edit_digest

	validates :nome, presence: true
	validates :email, presence: true, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
	validates :cpf, presence: true
	usar_como_cpf :cpf
	validates :matricula, presence: true, length: { is: 11 }
	validates :periodo, presence: true
	validates :curso, presence: true

  def CadastroE.digest(string)
    BCrypt::Password.create(string)
  end

  def CadastroE.novo_token
  	SecureRandom.urlsafe_base64
  end

  def autorizado?(token)
  	BCrypt::Password.new(edit_digest).is_password?(token)
  end


	private
		def downcase_email
			self.email = email.downcase
		end

		def criar_edit_digest
			self.edit_token = CadastroE.novo_token
			self.edit_digest = CadastroE.digest(edit_token)
		end
end