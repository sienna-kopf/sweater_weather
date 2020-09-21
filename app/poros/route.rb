class Route
  attr_reader :name,
              :type,
              :rating,
              :location,
              :latitude,
              :longitude

  def initialize(route_info)
    @name = route_info[:name]
    @type = route_info[:type]
    @rating = route_info[:rating]
    @location = route_info[:location]
    @latitude = route_info[:latitude]
    @longitude = route_info[:longitude]
  end
end
