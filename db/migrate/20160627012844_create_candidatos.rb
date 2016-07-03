class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :nome
      t.string :email
      t.string :cpf
      t.string :matricula
      t.integer :periodo

      t.timestamps null: false
    end
  end
end
