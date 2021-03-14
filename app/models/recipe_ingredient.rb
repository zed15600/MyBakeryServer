class RecipeIngredient < ApplicationRecord
  belongs_to :stock
  belongs_to :unit

  delegate :name, to: :stock
end
