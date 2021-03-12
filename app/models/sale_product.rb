class SaleProduct < ApplicationRecord
  before_save :set_value

  belongs_to :sale, optional: true
  belongs_to :product, autosave: true

  validates :product_id, :quantity, presence: true

  def set_value
    self.value = product.price * quantity
  end
end
