class HourlyForecast
  attr_reader :dt,
              :temp,
              :icon

  def initialize(hourly_forecast_info)
    @dt = hourly_forecast_info[:dt]
    @temp = hourly_forecast_info[:temp].round(0)
    @icon = hourly_forecast_info[:weather][0][:icon]
  end
end
