# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :shoes, class_name: "Shoe", foreign_key: "owner_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, class_name: "Like", foreign_key: "fan_id"

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
