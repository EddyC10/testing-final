# == Schema Information
#
# Table name: shoes
#
#  id          :integer          not null, primary key
#  authentic   :boolean
#  deadstock   :boolean
#  description :text
#  image       :string
#  shoe_type   :string
#  size        :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#
class Shoe < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, class_name: "Like", foreign_key: "fan_id"

  mount_uploader :image, ImageUploader
end
