class Payment < ApplicationRecord

  belongs_to :vendor
	
	validates :date, :vendor_id, :value, presence: true

end
