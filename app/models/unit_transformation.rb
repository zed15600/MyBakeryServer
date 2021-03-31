# == Schema Information
#
# Table name: unit_transformations
#
#  id         :bigint           not null, primary key
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stock_id   :bigint
#  to_unit_id :bigint
#  unit_id    :bigint
#
class UnitTransformation < ApplicationRecord
  belongs_to :from, class_name: "Unit", foreign_key: :unit_id
  belongs_to :to, class_name: "Unit", foreign_key: :to_unit_id
  belongs_to :stock, optional: true
end
