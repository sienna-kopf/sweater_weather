class ClimbingRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :routes
end
