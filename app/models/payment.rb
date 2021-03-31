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
class Payment < ApplicationRecord
  belongs_to :vendor

	validates :date, :vendor_id, :value, presence: true

  before_create :reduce_vendor_debt_create

  private

  def reduce_vendor_debt_create
    vendor.debt -= value
    vendor.save
  end
end
