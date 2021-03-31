# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint
#
class Unit < ApplicationRecord
  belongs_to :base, optional: true, class_name: "Unit", foreign_key: :unit_id
  has_many :units
end
