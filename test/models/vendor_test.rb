# == Schema Information
#
# Table name: vendors
#
#  id         :bigint           not null, primary key
#  debt       :integer          default(0), not null
#  name       :string
#  profit     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
