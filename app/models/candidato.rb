class Candidato < ActiveRecord::Base
	belongs_to :curso
	belongs_to :data_dinamica

	validates :nome, presence: true
	validates :email, presence: true, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
	validates :cpf, presence: true
	usar_como_cpf :cpf
	validates :matricula, presence: true, length: { is: 11 }
	validates :periodo, presence: true
	validates :curso_id, presence: true
	validates :data_dinamica_id, presence: true
end
