# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  date       :date
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  vendor_id  :bigint
#
require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
