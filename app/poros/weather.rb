class Weather
  attr_reader :id,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(current_forecast, hourly_forecast, daily_forecast)
    @id =  nil
    @current_forecast = current_forecast
    @hourly_forecast = hourly_forecast
    @daily_forecast = daily_forecast
  end
end
