class CurrentForecast
  attr_reader :dt,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :main_description,
              :description,
              :icon

  def initialize(current_forecast_info)
    @dt = current_forecast_info[:dt]
    @sunrise = current_forecast_info[:sunrise]
    @sunset = current_forecast_info[:sunset]
    @temp = current_forecast_info[:temp].round(0)
    @feels_like = current_forecast_info[:feels_like].round(0)
    @humidity = current_forecast_info[:humidity]
    @uvi = current_forecast_info[:uvi].round(0)
    @visibility = current_forecast_info[:visibility]
    @main_description = current_forecast_info[:weather][0][:main]
    @description = current_forecast_info[:weather][0][:description]
    @icon = current_forecast_info[:weather][0][:icon]
  end
end
