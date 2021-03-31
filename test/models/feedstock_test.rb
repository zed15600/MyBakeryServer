# == Schema Information
#
# Table name: feedstocks
#
#  id          :bigint           not null, primary key
#  name        :string
#  price       :integer
#  unit_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider_id :bigint
#  stock_id    :bigint
#  unit_id     :bigint
#
require 'test_helper'

class FeedstockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
