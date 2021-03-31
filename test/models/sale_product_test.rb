# == Schema Information
#
# Table name: sale_products
#
#  id          :bigint           not null, primary key
#  paid_amount :integer          default(0)
#  quantity    :integer
#  value       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#  sale_id     :bigint
#
require 'test_helper'

class SaleProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
