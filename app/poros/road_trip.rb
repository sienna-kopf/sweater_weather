class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(origin, destination, travel_time, arrival_forecast)
    @id =  nil
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end
end
