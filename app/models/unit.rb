class Unit < ApplicationRecord
  belongs_to :unit, optional: true
  has_many :units
end
