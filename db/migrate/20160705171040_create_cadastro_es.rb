class CreateCadastroEs < ActiveRecord::Migration
  def change
    create_table :cadastro_es do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :matricula
      t.integer :periodo
      t.string :curso
      t.string :evento

      t.timestamps null: false
    end
  end
end
