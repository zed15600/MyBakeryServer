# == Schema Information
#
# Table name: sales
#
#  id             :bigint           not null, primary key
#  date           :date
#  discount       :float            default(0.0), not null
#  total_value    :integer
#  vendors_profit :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vendor_id      :bigint
#
require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
