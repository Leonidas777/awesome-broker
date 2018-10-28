class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.text :description
      t.string :preview_url
      t.boolean :published, default: true
      t.string :external_id
      t.string :property_type
      t.string :external_url
      t.float :price, default: 0.0
      t.float :floor_area, default: 0.0
      t.integer :rooms, default: 0
      t.integer :bathrooms, default: 0
      t.string :city

      t.index  :external_id, unique: true

      t.timestamps
    end
  end
end
