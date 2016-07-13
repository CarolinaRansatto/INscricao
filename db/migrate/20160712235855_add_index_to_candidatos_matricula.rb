class AddIndexToCandidatosMatricula < ActiveRecord::Migration
  def change
  	add_index :candidatos, :matricula, unique: true
  end
end
