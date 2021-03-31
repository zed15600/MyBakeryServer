# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  min_stock  :integer
#  name       :string
#  quantity   :integer          default(0), not null
#  relevant   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint
#
class Stock < ApplicationRecord
  belongs_to :unit
  has_many :feedstocks
end
