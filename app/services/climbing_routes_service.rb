class ClimbingRoutesService
  def routes(lat, lon)
    to_json("/data/get-routes-for-lat-lon?lat=#{lat}&lon=#{lon}&maxResults=20")
  end

  private

  def conn
    Faraday.new('https://www.mountainproject.com') do |f|
      f.params[:key] = "#{ENV['MOUNTAIN_PROJECT_API_KEY']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
