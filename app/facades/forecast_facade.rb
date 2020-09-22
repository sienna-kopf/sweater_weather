class ForecastFacade
  attr_reader :location

  def initialize(location)
    @lat = lat_lon(location).lat
    @lon = lat_lon(location).lon
    @service = WeatherService.new
  end

  def lat_lon(location)
    MapQuestFacade.new(location).lat_long
  end

  def response_forecast
    @service.forecast(@lat, @lon)
  end

  def weather
    Weather.new(current_forecast, hourly_forecast, daily_forecast)
  end

  def forecast_condensed(travel_time)
    forecast_info = response_forecast[:hourly][(hour_selection(travel_time) - 1)]

    ForecastCondensed.new(forecast_info)
  end

  def hour_selection(travel_time)
    (Time.parse(travel_time) + 1800).beginning_of_hour.strftime("%k").to_i
  end 

  def current_forecast
    current_forecast_info = response_forecast[:current]

    CurrentForecast.new(current_forecast_info)
  end

  def hourly_forecast
    hourly_forecast_info = response_forecast[:hourly]

    hourly_forecast_info.map do |hourly_weather|
      HourlyForecast.new(hourly_weather)
    end.take(8)
  end

  def daily_forecast
    daily_forecast_info = response_forecast[:daily]

    daily_forecast_info.map do |daily_weather|
      DailyForecast.new(daily_weather)
    end.take(6)
  end
end
