# == Schema Information
#
# Table name: expenditures_feedstocks
#
#  id             :bigint           not null, primary key
#  ammount        :float
#  price          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  expenditure_id :bigint
#  feedstock_id   :bigint
#
class ExpendituresFeedstock < ApplicationRecord
  belongs_to :expenditure
  belongs_to :feedstock

	delegate :stock, to: :feedstock, prefix: false

  validates :ammount, :price, presence: true, numericality: {greater_than: 0}

	after_create :update_stock_create

	private

	def update_stock_create
		p "updating stock #{feedstock.stock}"
		if feedstock.stock
			p "Stock found"
			if feedstock.unit == stock.unit || feedstock.unit.base == stock.unit
				stock.quantity += ammount * feedstock.unit_value * feedstock.unit.value
			else
				transform = UnitTransformation
					.where(from: feedstock.unit, to: stock.unit, stock: nil)
					.or(
						UnitTransformation
							.where(from: feedstock.unit, to: stock.unit, stock: feedstock.stock)
					).first
					p "Transform #{transform}"
					stock.quantity += ammount * feedstock.unit_value * transform.value
			end
			stock.save
		end
	end
end
