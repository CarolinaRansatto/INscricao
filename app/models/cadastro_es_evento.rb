class CadastroEsEvento < ActiveRecord::Base
    has_many :eventos
    has_many :cadastro_es
end
