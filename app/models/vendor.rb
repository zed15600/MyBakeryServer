class Vendor < ApplicationRecord

	has_many :sales
	has_many :payments

  validates :name, presence: true

end
