# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  description :text
#  make        :string
#  model       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Vehicle < ApplicationRecord
end
