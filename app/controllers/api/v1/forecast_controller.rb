class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]

    lat_long = MapQuestFacade.new(location).lat_long
    lat = lat_long.lat
    lon = lat_long.lon
    
    forecast_facade = ForecastFacade.new(lat, lon)
    current_forecast = forecast_facade.current_forecast
    hourly_forecast = forecast_facade.hourly_forecast
    daily_forecast = forecast_facade.daily_forecast

    render json: ForecastSerializer.new(current_forecast, hourly_forecast, daily_forecast).data_hash
  end
end
