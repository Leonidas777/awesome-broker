class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.text :description
      t.string :preview_url
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
