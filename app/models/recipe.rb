class Recipe < ApplicationRecord
  belongs_to :product
  has_many :ingredients, class_name: "RecipeIngredient"

  accepts_nested_attributes_for :ingredients
end
