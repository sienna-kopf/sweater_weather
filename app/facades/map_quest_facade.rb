class MapQuestFacade
  attr_reader :origin,
              :destination

  def initialize(origin, destination = nil)
    @origin = origin
    @destination = destination
    @service = MapQuestService.new
  end

  def response_lat_long
    @service.lat_long(@origin)
  end

  def lat_long
    coordinate_info = response_lat_long[:results][0][:locations][0]

    Coordinate.new(coordinate_info)
  end

  def response_road_trip
    @service.road_trip(@origin, @destination)
  end

  def trip
    trip_info = response_road_trip[:route]

    Trip.new(trip_info)
  end
end
