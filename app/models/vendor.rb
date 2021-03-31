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
class Vendor < ApplicationRecord
  has_many :sales
  has_many :payments

  validates :name, presence: true

  default_scope { order(:id) }
end
