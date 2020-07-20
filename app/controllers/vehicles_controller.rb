class VehiclesController < ApplicationController
  def index
    render json: VehicleSerializer.new(paginated_vehicles).serialized_json
  end

  private

  def current_page
    params[:page].presence
  end

  def paginated_vehicles
    Vehicle.paginated(current_page).all
  end
end
