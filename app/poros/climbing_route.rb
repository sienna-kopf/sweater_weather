class ClimbingRoute
  attr_reader :id,
              :location,
              :forecast,
              :routes


  def initialize(location, forecast, routes)
    @id =  nil
    @location = location
    @forecast = forecast
    @routes = routes
  end
end
