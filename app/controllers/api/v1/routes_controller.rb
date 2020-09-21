class Api::V1::RoutesController < ApplicationController
  def index
    location = params[:location]

    lat_long = MapQuestFacade.new(location).lat_long
    lat = lat_long.lat
    lon = lat_long.lon

    current_weather = ForecastFacade.new(lat, lon).current_forecast
    binding.pry

  end
end
