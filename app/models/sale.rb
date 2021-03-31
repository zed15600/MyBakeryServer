# == Schema Information
#
# Table name: sales
#
#  id             :bigint           not null, primary key
#  date           :date
#  discount       :float            default(0.0), not null
#  total_value    :integer
#  vendors_profit :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vendor_id      :bigint
#
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
  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  validates :date, :vendor_id, :total_value, presence: true
  validates_with ConsistencyValidator

  scope :by_date, -> { order(date: :desc) }

  def next
    return if find_location < 1
    @ids[find_location - 1]
  end

  def previous
    find_location
    @ids[find_location + 1]
  end

  #private

  def find_location
    @ids ||= Sale.by_date.ids
    @location ||= @ids.index(id)
  end
end
