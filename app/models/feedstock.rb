# == Schema Information
#
# Table name: feedstocks
#
#  id          :bigint           not null, primary key
#  name        :string
#  price       :integer
#  unit_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider_id :bigint
#  stock_id    :bigint
#  unit_id     :bigint
#
class Feedstock < ApplicationRecord
  belongs_to :unit
  belongs_to :provider
	belongs_to :stock, optional: true
	has_many :expenditures_feedstocks
	has_many :expenditures, :through => :expenditures_feedstocks

	validates :name, :price, :unit, :provider, presence: true
end
