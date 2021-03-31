# == Schema Information
#
# Table name: expenditures
#
#  id          :bigint           not null, primary key
#  date        :date
#  total_value :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ExpenditureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
