class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]

    lat_long = MapQuestFacade.new(location).lat_long
    lat = lat_long.lat
    lon = lat_long.lon

    render json: ForecastSerializer.new(ForecastFacade.new(lat, lon).weather)
  end
end
