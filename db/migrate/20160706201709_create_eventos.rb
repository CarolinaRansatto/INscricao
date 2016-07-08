class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
