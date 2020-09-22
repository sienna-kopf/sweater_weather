require 'rails_helper'

RSpec.describe ClimbingRoute do
  it 'exists' do
    origin = "denver, co"
    destination = "pueblo, co"
    travel_time = "01:43:57"

    forecast_attrs =
    {
        "temp": 62.38,
        "weather": [
            {
                "description": "clear sky",
            }
        ]
    }

    arrival_weather = ForecastCondensed.new(forecast_attrs)

    road_trip = RoadTrip.new(origin, destination, travel_time, arrival_weather)

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.origin).to eq("denver, co")
    expect(road_trip.origin).to be_a String
    expect(road_trip.destination).to eq("pueblo, co")
    expect(road_trip.destination).to be_a String
    expect(road_trip.travel_time).to eq("01:43:57")
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.arrival_forecast).to be_a ForecastCondensed
  end
end
