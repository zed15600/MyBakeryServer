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
