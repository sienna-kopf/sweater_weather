class CurrentForecastCondensed
  attr_reader :temperature,
              :summary

  def initialize(current_forecast_info)
    @temperature = current_forecast_info[:temp].round(0)
    @summary = current_forecast_info[:weather][0][:description]
  end
end
