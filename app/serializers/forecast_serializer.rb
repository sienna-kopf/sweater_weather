class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_forecast, :hourly_forecast, :daily_forecast

  # def initialize(current_forecast, hourly_forecast, daily_forecast)
  #   @current_forecast = current_forecast
  #   @hourly_forecast = hourly_forecast
  #   @daily_forecast = daily_forecast
  # end
  #
  # def data_hash
  #   {
  #     data:
  #     {
  #       current_forecast:
  #       {
  #         type: 'forecast',
  #         attributes: @current_forecast.as_json
  #       },
  #       hourly_forecast:
  #       {
  #         type: 'forecast',
  #         attributes: @hourly_forecast.as_json
  #       },
  #       daily_forecast:
  #       {
  #         type: 'forecast',
  #         attributes: @daily_forecast.as_json
  #       }
  #     }
  #   }
  # end
end
