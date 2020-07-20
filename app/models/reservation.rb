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
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validate :date_consistency
  validate :available?
  validates :start_time, presence: true
  validates :end_time, presence: true

  private

  def date_consistency
    errors.add(:start_time, 'start_time cannot occur after end_time') unless start_time < end_time
  end

  def available?
    errors.add(:start_time, 'Time slot not avialible') unless vehicle.reservations.where(vehicle_id: vehicle_id).where('start_time > ? OR end_time < ?', start_time, end_time).count.zero?
  end
end
