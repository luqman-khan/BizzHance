class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.text :item_name
      t.text :problem_description
      t.text :item_condition
      t.text :repair_description
      t.text :charge_note
      t.decimal :data_saving
      t.decimal :total_charge
      t.belongs_to :user, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
