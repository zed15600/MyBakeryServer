class Feedstock < ApplicationRecord

	validates :name, :price, :unit, :provider, presence: true
  
        belongs_to :unit
        belongs_to :provider
	has_many :expenditures_feedstocks
	has_many :expenditures, :through => :expenditures_feedstocks
end
