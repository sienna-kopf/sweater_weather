class ForecastFacade
  attr_reader :lat,
              :lon

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
    @service = WeatherService.new
  end

  def response_forecast
    @service.forecast(@lat, @lon)
  end

  def weather
    Weather.new(current_forecast, hourly_forecast, daily_forecast)
  end

  def forecast_condensed(travel_time)
    time = (Time.parse(travel_time) + 1800).to_s
    date_time = DateTime.parse(time).beginning_of_hour

    final_time = date_time.strftime("%k").to_i
    forecast_info = response_forecast[:hourly][(final_time - 1)]

    ForecastCondensed.new(forecast_info)
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
