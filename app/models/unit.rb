class Unit < ApplicationRecord
  belongs_to :base, optional: true, class_name: "Unit", foreign_key: :unit_id
  has_many :units
end
