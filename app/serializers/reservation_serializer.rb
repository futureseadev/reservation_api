# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  end_time   :datetime
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  vehicle_id :integer          not null
#
# Indexes
#
#  index_reservations_on_user_id     (user_id)
#  index_reservations_on_vehicle_id  (vehicle_id)
#
# Foreign Keys
#
#  user_id     (user_id => users.id)
#  vehicle_id  (vehicle_id => vehicles.id)
#
class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_time, :end_time, :user_id, :vehicle_id
end
