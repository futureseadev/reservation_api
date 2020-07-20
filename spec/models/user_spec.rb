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
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
end
