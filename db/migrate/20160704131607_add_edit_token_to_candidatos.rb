class AddEditTokenToCandidatos < ActiveRecord::Migration
  def change
    add_column :candidatos, :edit_digest, :string
  end
end
