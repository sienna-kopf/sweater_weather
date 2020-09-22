class Api::V1::RoadTripController < ApplicationController
  def show
    if User.find_by(api_key: road_trip_params[:api_key])
      origin = road_trip_params[:origin]
      destination = road_trip_params[:destination]
      trip = MapQuestFacade.new(origin, destination).trip

      lat_long = MapQuestFacade.new(destination).lat_long
      lat = lat_long.lat
      lon = lat_long.lon

      forecast = ForecastFacade.new(lat, lon).forecast_condensed(trip.travel_time)

      render json: RoadTripSerializer.new(RoadTrip.new(origin, destination, trip.travel_time, forecast))
    else
      render json: {}, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
