class WeatherService
  def forecast(lat, lon)
    to_json("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely")
  end

  private

  def conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params[:appid] = "#{ENV['OPEN_WEATHER_API_KEY']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
