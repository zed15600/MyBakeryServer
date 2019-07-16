class Sale < ApplicationRecord

  belongs_to :product
  belongs_to :vendor

	validates :date, :vendor_id, :product_id, :ammount, :total_value, presence: true

end
