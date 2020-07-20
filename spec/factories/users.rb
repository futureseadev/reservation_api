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
    login { 'MyString' }
    email { 'MyString' }
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
