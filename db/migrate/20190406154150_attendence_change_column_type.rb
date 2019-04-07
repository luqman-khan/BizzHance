class AttendenceChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    remove_column :attendances, :decimal
  end

  def down
    remove_column :attendances, :decimal
  end
end
