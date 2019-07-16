class MultiplicityValidator < ActiveModel::Validator
	
	def validate(record)
		if record.price % record.ammount != 0
			record.errors[:base] << "The feedstock price is not a multiple of the total value for " + record.feedstock.name
		end
	end

end

class ExpendituresFeedstock < ApplicationRecord

  belongs_to :expenditure
  belongs_to :feedstock

  validates :ammount, :price, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates_with MultiplicityValidator

end
