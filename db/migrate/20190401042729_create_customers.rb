class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.decimal :total_purchase
      t.decimal :total_repair
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
