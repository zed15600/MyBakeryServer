class UnitTransformation < ApplicationRecord
  belongs_to :from, class_name: "Unit", foreign_key: :unit_id
  belongs_to :to, class_name: "Unit", foreign_key: :to_unit_id
  belongs_to :stock, optional: true
end
