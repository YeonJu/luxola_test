class CreateProductLists < ActiveRecord::Migration
  def change
    create_table :product_lists do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
