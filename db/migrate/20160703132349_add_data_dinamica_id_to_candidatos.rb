class AddDataDinamicaIdToCandidatos < ActiveRecord::Migration
  def change
    add_column :candidatos, :data_dinamica_id, :integer
  end
end
