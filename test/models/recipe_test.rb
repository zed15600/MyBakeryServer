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
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
