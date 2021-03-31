# == Schema Information
#
# Table name: productions
#
#  id         :bigint           not null, primary key
#  date       :date
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#
require 'test_helper'

class ProductionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
