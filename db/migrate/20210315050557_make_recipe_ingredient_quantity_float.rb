class MakeRecipeIngredientQuantityFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :recipe_ingredients, :quantity, :float
  end
end
