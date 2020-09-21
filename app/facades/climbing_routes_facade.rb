class ClimbingRoutesFacade
  attr_reader :lat,
              :lon

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
    @service = ClimbingRoutesService.new
  end

  def response_routes
    @service.routes(@lat, @lon)
  end

  def routes
    route_array = response_routes[:routes]

    route_array.map do |route_info|
      Route.new(route_info)
    end 
  end
end
