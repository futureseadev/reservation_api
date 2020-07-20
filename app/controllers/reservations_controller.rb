class ReservationsController < ApplicationController
  def create
    if new_reservation.valid? && new_reservation.save
      render json: ReservationSerializer.new(new_reservation).serialized_json, status: :created
    else
      render json: { errors: new_reservation.errors }, status: :unprocessable_entity
    end
  end

  private

  def new_reservation
    @new_reservation ||= Reservation.new(user_id: user[:id], vehicle_id: vehicle_id, start_time: start_time, end_time: end_time)
  end

  def create_reservation_params
    params.require(:reservation).permit(:vehicle_id, :start_time, :end_time, user: %i[id email login password password_confirmation])
  end

  def user_id
    create_reservation_params[:user][:id]
  end

  def vehicle_id
    create_reservation_params[:vehicle_id]
  end

  def start_time
    create_reservation_params[:start_time]
  end

  def end_time
    create_reservation_params[:end_time]
  end

  def user
    @user ||= if user_id
                User.find(user_id)
              else
                User.create(create_reservation_params[:user])
              end
  end
end
