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
FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'Password123!' }
    password_confirmation { 'Password123!' }
  end
end
