# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  login           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :reservations
end
