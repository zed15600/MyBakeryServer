# == Schema Information
#
# Table name: expenditures_feedstocks
#
#  id             :bigint           not null, primary key
#  ammount        :float
#  price          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  expenditure_id :bigint
#  feedstock_id   :bigint
#
require 'test_helper'

class ExpendituresFeedstockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
