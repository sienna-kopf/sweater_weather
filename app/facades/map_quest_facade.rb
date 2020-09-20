class MapQuestFacade
  attr_reader :location

  def initialize(location)
    @location = location
    @service = MapQuestService.new
  end

  def response_lat_long
    @service.lat_long(@location)
  end

  def lat_long
    coordinate_info = response_lat_long[:results][0][:locations][0]

    Coordinate.new(coordinate_info)
  end
end
