class ClimbingRoute
  attr_reader :id,
              :location,
              :current_forecast,
              :routes


  def initialize(location, current_forecast, routes)
    @id =  nil
    @location = location
    @current_forecast = current_forecast
    @routes = routes
  end
end 
