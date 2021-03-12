class RecipeIngredient < ApplicationRecord
  belongs_to :stock
  belongs_to :unit
end
