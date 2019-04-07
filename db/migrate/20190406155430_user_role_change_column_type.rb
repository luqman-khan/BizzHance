class UserRoleChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :role
    add_column :users, :role, :integer
  end

  def down
    remove_column :users, :role
    add_column :users, :role, :string
  end
end
