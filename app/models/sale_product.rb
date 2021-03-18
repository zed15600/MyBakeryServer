class SaleProduct < ApplicationRecord
  belongs_to :sale, optional: true
  belongs_to :product, autosave: true

  validates :product_id, :quantity, presence: true

  before_create :reduce_stock_create
  before_save :set_value

  private

  def set_value
    self.value = product.price * quantity
  end

  def reduce_stock_create
    product.stock -= quantity
    product.save
  end
end
