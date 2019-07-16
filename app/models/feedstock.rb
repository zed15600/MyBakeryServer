class Feedstock < ApplicationRecord

	validates :name, :price, :unit, :provider, presence: true

	has_many :expenditures_feedstocks
	has_many :expenditures, :through => :expenditures_feedstocks
end
