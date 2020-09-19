class Coordinate
  attr_reader :lat,
              :lon

  def initialize(coordinate_info)
    @lat = coordinate_info[:latLng][:lat]
    @lon = coordinate_info[:latLng][:lng]
  end
end
