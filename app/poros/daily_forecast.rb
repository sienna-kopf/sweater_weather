class DailyForecast
  attr_reader :dt,
              :temp,
              :temp_min,
              :temp_max,
              :main_description,
              :icon,
              :rain,
              :snow

  def initialize(daily_forecast_info)
    @dt = daily_forecast_info[:dt]
    @temp = daily_forecast_info[:temp][:day].round(0)
    @temp_min = daily_forecast_info[:temp][:min].round(0)
    @temp_max = daily_forecast_info[:temp][:max].round(0)
    @main_description = daily_forecast_info[:weather][0][:main]
    @icon = daily_forecast_info[:weather][0][:icon]
    @rain = daily_forecast_info[:rain]
    @snow = daily_forecast_info[:snow]
  end
end
