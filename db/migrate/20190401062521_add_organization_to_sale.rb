class AddOrganizationToSale < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :organization, foreign_key: true
  end
end
