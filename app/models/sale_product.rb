# == Schema Information
#
# Table name: sale_products
#
#  id          :bigint           not null, primary key
#  paid_amount :integer          default(0)
#  quantity    :integer
#  value       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#  sale_id     :bigint
#
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
