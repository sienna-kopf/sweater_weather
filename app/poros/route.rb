class Route
  attr_reader :name,
              :type,
              :rating,
              :location,
              :latitude,
              :longitude,
              :distance_to_route

  def initialize(route_info, location)
    @name = route_info[:name]
    @type = route_info[:type]
    @rating = route_info[:rating]
    @location = route_info[:location]
    @latitude = route_info[:latitude]
    @longitude = route_info[:longitude]
    @distance_to_route = MapQuestService.new.distance_to_route(location, @latitude, @longitude)[:route][:distance].round(2).to_s
  end
end
