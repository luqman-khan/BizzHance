class AddSaleNumberToSale < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :sale_number, :bigint
  end
end
