class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.text :item_sold
      t.decimal :item_price
      t.text :note
      t.datetime :date_of_sale
      t.belongs_to :user, foreign_key: true
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
