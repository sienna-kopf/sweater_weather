class Api::V1::RoutesController < ApplicationController
  def index
    location = params[:location]

    lat_long = MapQuestFacade.new(location).lat_long
    lat = lat_long.lat
    lon = lat_long.lon

    forecast = ForecastFacade.new(lat, lon).current_forecast_condensed

    routes = ClimbingRoutesFacade.new(lat, lon, location).routes

    render json: ClimbingRouteSerializer.new(ClimbingRoute.new(location, forecast, routes))
  end
end
