class ForecastCondensed
  attr_reader :temperature,
              :summary

  def initialize(forecast_info)
    @temperature = forecast_info[:temp].round(0).to_s
    @summary = forecast_info[:weather][0][:description]
  end
end
