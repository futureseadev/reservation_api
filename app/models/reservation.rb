class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validate :date_consistency
  validate :available?
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :reserved_between, ->(start_date, end_date) { where('start_time >= ? AND end_time <= ?', start_date, end_date) }

  private

  def date_consistency
    errors.add(:start_time, 'start_time cannot occur after end_time') unless start_time < end_time
  end

  def available?
    errors.add(:start_time, 'Time slot not avialible') unless vehicle.reservations.where('start_time > ? OR end_time < ?', start_time, end_time).count.zero?
  end
end
