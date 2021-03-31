# == Schema Information
#
# Table name: recipes
#
#  id                :bigint           not null, primary key
#  expected_quantity :integer
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint
#
class Recipe < ApplicationRecord
  belongs_to :product
  has_many :ingredients, class_name: "RecipeIngredient"

  accepts_nested_attributes_for :ingredients
end
