class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :owner
      t.text :contact
      t.text :address
      t.boolean :authorize

      t.timestamps
    end
  end
end
