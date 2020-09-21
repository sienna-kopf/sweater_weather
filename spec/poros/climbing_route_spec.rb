require 'rails_helper'

RSpec.describe ClimbingRoute do
  it 'exists' do
    location = "erwin, tn"

    current_attrs =
    {
        "dt": 1600706881,
        "sunrise": 1600687030,
        "sunset": 1600730877,
        "temp": 62.38,
        "feels_like": 60.42,
        "humidity": 64,
        "uvi": 8.39,
        "visibility": 10000,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01d"
            }
        ]
    }

    route_array =
    [
        {
            "name": "Crescent",
            "type": "Trad, Ice, Snow, Alpine",
            "rating": "WI3- Mod. Snow",
            "location": [
                "North Carolina",
                "Northern Mountains Region",
                "Black Mountain Range Alpine"
            ],
            "longitude": -82.2401,
            "latitude": 35.8536
        },
        {
            "id": 109014692,
            "name": "Tiny Roof Crack",
            "type": "Boulder",
            "rating": "V4+",
            "location": [
                "Tennessee",
                "Blue Hole Falls",
                "Highball Area",
                "Shaky Knees Boulder"
            ],
            "longitude": -82.6642,
            "latitude": 36.2863
        },
        {
            "id": 111630041,
            "name": "La Cascada",
            "type": "Boulder",
            "rating": "V5",
            "location": [
                "Tennessee",
                "Blue Hole Falls",
                "Lower Blue Hole",
                "Levitation Boulder"
            ],
            "longitude": -82.796,
            "latitude": 36.2508
        }
      ]


    routes = route_array.map do |route_info|
      Route.new(route_info, location)
    end

    current_weather = CurrentForecast.new(current_attrs)

    climbing_route = ClimbingRoute.new(location, current_weather, routes)

    expect(climbing_route).to be_a ClimbingRoute
    expect(climbing_route.location).to eq("erwin, tn")
    expect(climbing_route.location).to be_a String
    expect(climbing_route.forecast).to be_a CurrentForecast
    expect(climbing_route.routes).to be_an Array
    expect(climbing_route.routes[0]).to be_a Route
  end
end
