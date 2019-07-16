class TotalValidator < ActiveModel::Validator

	def validate(record)
		sum = 0
		record.expenditures_feedstocks.each do |ef|
			sum += ef.price
		end
		if sum!=record.total_value
			record.errors[:base] << "The total value don't match the feedstocks prices"
		end
	end

end

class NoRepetitionValidator < ActiveModel::Validator

	def validate(record)
		ids = record.expenditures_feedstocks.collect{|f| f.feedstock_id}
		ids.each do |i|
			if ids.count(i) > 1
				#record.expenditures_feedstocks.delete(
				record.errors[:base] << "Repeated feedstock " + Feedstock.find(i).name
			end
		end
	end

end

class Expenditure < ApplicationRecord

  has_many :expenditures_feedstocks
  has_many :feedstocks, :through => :expenditures_feedstocks

  validates_associated :expenditures_feedstocks
  validates :date, :total_value, presence: true
  validates :total_value, numericality: {only_integer: true}
  validates_with TotalValidator, NoRepetitionValidator

end
