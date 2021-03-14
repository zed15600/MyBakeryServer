class ProductionStock < ApplicationRecord
  belongs_to :production
  belongs_to :stock
  belongs_to :unit
  
  delegate :name, to: :stock
end
