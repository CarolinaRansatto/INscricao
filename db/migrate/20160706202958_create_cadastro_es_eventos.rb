class CreateCadastroEsEventos < ActiveRecord::Migration
  def change
    create_table :cadastro_es_eventos do |t|

      t.timestamps null: false
    end
  end
end
