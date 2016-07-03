class AddCursoIdToCandidatos < ActiveRecord::Migration
  def change
    add_column :candidatos, :curso_id, :integer
  end
end
