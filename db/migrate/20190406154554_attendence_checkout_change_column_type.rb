class AttendenceCheckoutChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    remove_column :attendances, :check_out
    add_column :attendances, :check_out, :datetime
  end

  def down
    remove_column :attendances, :check_out
    add_column :attendances, :check_out, :string
  end
end
