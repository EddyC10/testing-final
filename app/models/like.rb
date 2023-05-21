# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  shoe_id    :integer
#
class Like < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "fan_id"
  belongs_to :shoe, class_name: "Shoe", foreign_key: "shoe_id"
end
