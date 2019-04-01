class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.datetime :check_in
      t.string :check_out
      t.string :datetime
      t.string :hourly_pay
      t.string :decimal
      t.decimal :total_pay
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
