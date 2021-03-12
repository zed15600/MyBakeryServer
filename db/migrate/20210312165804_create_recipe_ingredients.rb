class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :stock, foreign_key: true
      t.integer :quantity
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
