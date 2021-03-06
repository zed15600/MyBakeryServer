# == Schema Information
#
# Table name: recipe_ingredients
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :bigint
#  stock_id   :bigint
#  unit_id    :bigint
#
class RecipeIngredient < ApplicationRecord
  belongs_to :stock
  belongs_to :unit

  delegate :name, to: :stock
end
