class ConsistencyValidator < ActiveModel::Validator
  def validate(record)
    total = 0
    record.sale_products.each do |product|
      total += product.value
    end
    if record.total_value != total
      record.errors[:base] << "There should be consistency between the sale total(#{record.total_value}) and the product prices(#{total})\n#{record.sale_products}"
    end
  end
end

class Sale < ApplicationRecord
  belongs_to :vendor
  has_many :sale_products
  has_many :products, through: :sale_producys

  validates :date, :vendor_id, :total_value, presence: true
  validates_with ConsistencyValidator
end
