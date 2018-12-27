class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.date :expire_date
      t.string :name
      t.integer :sku_id
      t.text :categories
      t.text :tags
      t.text :images
      t.integer :price

      t.timestamps
    end
  end
end