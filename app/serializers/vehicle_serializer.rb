class VehicleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :make, :model, :description
end
