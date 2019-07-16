class Product < ApplicationRecord

	has_many :sales

  validates :name, :description, :price, presence: true

end
