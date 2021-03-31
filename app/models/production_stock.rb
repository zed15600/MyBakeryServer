# == Schema Information
#
# Table name: production_stocks
#
#  id            :bigint           not null, primary key
#  quantity      :integer
#  production_id :bigint
#  stock_id      :bigint
#  unit_id       :bigint
#
class ProductionStock < ApplicationRecord
  belongs_to :production
  belongs_to :stock
  belongs_to :unit
  
  delegate :name, to: :stock

  before_create :reduce_stock_create

  private

  def reduce_stock_create
    if stock.unit == unit
      stock.quantity -= quantity
    elsif unit.base == stock.unit
      transformed = quantity * unit.value
      stock.quantity -= transformed
    else
      base = unit.base || unit
      multiplier = unit.base ? unit.value : 1
      if transformation = UnitTransformation.find_by(from: base, to: stock.unit, stock: nil) ||
                          UnitTransformation.find_by(from: base, to: stock.unit, stock: stock)
        stock.quantity -= quantity * multiplier * transformation.value
      end
    end
    stock.save
  end
end
