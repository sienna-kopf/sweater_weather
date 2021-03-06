class MapQuestService
  def lat_long(location)
    to_json("/geocoding/v1/address?location=#{location}")
  end

  def road_trip(origin, destination)
    to_json("/directions/v2/route?from=#{origin}&to=#{destination}")
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com') do |f|
      f.params[:key] = "#{ENV['MAP_QUEST_API_KEY']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
