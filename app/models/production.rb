class Production < ApplicationRecord
  belongs_to :product
  has_many :stocks, class_name: "ProductionStock"

  accepts_nested_attributes_for :stocks

  before_create :increase_product_create

  private

  def increase_product_create
    product.stock += quantity
    product.save
  end
end
