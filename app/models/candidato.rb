class Candidato < ActiveRecord::Base
	belongs_to :curso
	belongs_to :data_dinamica

	attr_accessor :edit_token

	before_save :downcase_email
	before_create :criar_edit_digest

	validates :nome, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
	validates :cpf, presence: true
	usar_como_cpf :cpf
	validates :matricula, presence: true, uniqueness: true, length: { is: 9 },
		numericality: { only_integer: true }
	validates :periodo, presence: true
	validates :curso_id, presence: true
	validates :data_dinamica_id, presence: true

  def Candidato.digest(string)
    BCrypt::Password.create(string)
  end

  def Candidato.novo_token
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
			self.edit_token = Candidato.novo_token
			self.edit_digest = Candidato.digest(edit_token)
		end
end
