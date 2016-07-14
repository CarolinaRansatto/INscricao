class Curso < ActiveRecord::Base
	has_many :candidatos
	
	validates :nome, presence: true
end
