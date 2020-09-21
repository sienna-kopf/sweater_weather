class ClimbingRoutesFacade
  attr_reader :lat,
              :lon,
              :location

  def initialize(lat, lon, location)
    @lat = lat
    @lon = lon
    @location = location
    @service = ClimbingRoutesService.new
  end

  def response_routes
    @service.routes(@lat, @lon)
  end

  def routes
    route_array = response_routes[:routes]

    route_array.map do |route_info|
      Route.new(route_info, @location)
    end
  end
end
