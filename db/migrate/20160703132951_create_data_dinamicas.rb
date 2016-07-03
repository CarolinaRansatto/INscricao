class CreateDataDinamicas < ActiveRecord::Migration
  def change
    create_table :data_dinamicas do |t|
      t.date :data

      t.timestamps null: false
    end
  end
end
