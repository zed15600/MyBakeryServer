class CreateProductionStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :production_stocks do |t|
      t.references :production, foreign_key: true
      t.references :stock, foreign_key: true
      t.integer :quantity
      t.references :unit, foreign_key: true
    end
  end
end
