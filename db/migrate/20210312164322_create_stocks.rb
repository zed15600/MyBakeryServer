class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :quantity
      t.integer :min_stock
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
