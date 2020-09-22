class Trip
  attr_reader :travel_time

  def initialize(trip_info)
    @travel_time = trip_info[:formattedTime]
  end
end
