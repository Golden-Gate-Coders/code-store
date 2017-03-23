class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock
      t.integer :supplier_id
      t.string :image

      t.timestamps
    end
  end
end
