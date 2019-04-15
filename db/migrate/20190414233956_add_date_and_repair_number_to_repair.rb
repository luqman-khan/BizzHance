class AddDateAndRepairNumberToRepair < ActiveRecord::Migration[5.0]
  def change
  	add_column :repairs, :date_of_repair, :datetime
  	add_column :repairs, :date_of_repair_done, :datetime
  	add_column :repairs, :date_of_pickup, :datetime
  	add_column :repairs, :repair_number, :bigint
  end
end
