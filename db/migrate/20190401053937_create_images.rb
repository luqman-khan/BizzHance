class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :image_url
      t.belongs_to :repair, foreign_key: true
      t.belongs_to :sale, foreign_key: true
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
