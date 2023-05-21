# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  shoe_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  belongs_to :shoe, class_name: "Shoe", foreign_key: "shoe_id"
end
