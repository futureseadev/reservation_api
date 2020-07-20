require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'create' do
    it 'allows registered users to create a new reservation' do
      user = create(:user)
      vehicle = create(:vehicle)
      params = {
        reservation: { user: { id: user[:id] },
                       vehicle_id: vehicle[:id],
                       start_time: 5.days.from_now,
                       end_time: 6.days.from_now }

      }
      post '/reservations', params: params, headers: json_headers
      expect(response).to have_http_status(:created)
    end

    it 'allows new users to create a new reservation' do
      user = attributes_for(:user)
      vehicle = create(:vehicle)
      params = {
        reservation: { user: { password: user[:password], password_confirmation: user[:password_confirmation], email: user[:email] },
                       vehicle_id: vehicle[:id],
                       start_time: 5.days.from_now,
                       end_time: 6.days.from_now }

      }
      post '/reservations', params: params, headers: json_headers
      expect(response).to have_http_status(:created)
    end

    it 'does not alllow users to create reservation when end_time occurs before start_time' do
      user = create(:user)
      vehicle = create(:vehicle)
      params = {
        reservation: { user: { id: user[:id] },
                       vehicle_id: vehicle[:id],
                       start_time: 7.days.from_now,
                       end_time: 6.days.from_now }

      }
      post '/reservations', params: params, headers: json_headers
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'does not alllow users to create reservation when a vehicle is already reserved' do
      reservation = create(:reservation)
      params = {
        reservation: { user: { id: reservation.user.id },
                       vehicle_id: reservation.vehicle.id,
                       start_time: 5.days.from_now,
                       end_time: 6.days.from_now }

      }
      post '/reservations', params: params, headers: json_headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  def json_headers
    { 'ACCEPT' => 'application/json' }
  end
end
