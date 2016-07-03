class ChangeDataFormatInDataDinamica < ActiveRecord::Migration
  def up
    change_column :data_dinamicas, :data, :datetime
  end

  def down
    change_column :data_dinamicas, :data, :date
  end
end
