# == Schema Information
#
# Table name: unit_transformations
#
#  id         :bigint           not null, primary key
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stock_id   :bigint
#  to_unit_id :bigint
#  unit_id    :bigint
#
require 'test_helper'

class UnitTransformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
