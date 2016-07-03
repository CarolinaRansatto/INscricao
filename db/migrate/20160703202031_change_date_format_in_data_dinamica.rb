class ChangeDateFormatInDataDinamica < ActiveRecord::Migration
  def up
    change_column :data_dinamicas, :data, :string
  end

  def down
    change_column :data_dinamicas, :data, :datetime
  end
end
