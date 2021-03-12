class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.integer :expected_quantity

      t.timestamps
    end
  end
end
