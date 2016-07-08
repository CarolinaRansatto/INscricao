class DataDinamica < ActiveRecord::Base
	has_many :candidatos
	
	validates :data, presence:  true
end
