class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_forecast, :hourly_forecast, :daily_forecast
end
