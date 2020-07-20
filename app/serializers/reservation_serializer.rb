class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_time, :end_time, :user_id, :vehicle_id
end
