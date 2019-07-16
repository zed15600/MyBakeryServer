class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :when
      t.references :product, foreign_key: true
      t.integer :ammount
      t.integer :discount
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
