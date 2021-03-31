# == Schema Information
#
# Table name: providers
#
#  id               :bigint           not null, primary key
#  contact          :integer
#  deliver          :boolean
#  deliverCost      :integer
#  deliverMinAmount :integer
#  direction        :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
