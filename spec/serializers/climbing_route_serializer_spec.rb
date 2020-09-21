require 'rails_helper'

RSpec.describe ClimbingRouteSerializer do
  it '#serializes location, current_forecast, and routes into one response' do
    location = "erwin, tn"

    current_attrs =
    {
        "temp": 62.38,
        "weather": [
            {
                "description": "clear sky"
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

    current_weather = CurrentForecastCondensed.new(current_attrs)

    climbing_route = ClimbingRoute.new(location, current_weather, routes)

    json_response = ClimbingRouteSerializer.new(climbing_route).to_json

    route_response = JSON.parse(json_response, symbolize_names: true)

    expect(route_response).to be_a Hash
    expect(route_response).to have_key :data
    expect(route_response[:data]).to be_a Hash
    expect(route_response[:data]).to have_key :id
    expect(route_response[:data][:id]).to eq(nil)
    expect(route_response[:data]).to have_key :type
    expect(route_response[:data][:type]).to eq("climbing_route")
    expect(route_response[:data]).to have_key :attributes

    expect(route_response[:data][:attributes]).to be_a Hash
    expect(route_response[:data][:attributes]).to have_key :location
    expect(route_response[:data][:attributes]).to have_key :forecast
    expect(route_response[:data][:attributes]).to have_key :routes

    expect(route_response[:data][:attributes][:location]).to be_a String
    expect(route_response[:data][:attributes][:location]).to eq('erwin, tn')

    expect(route_response[:data][:attributes][:forecast]).to be_a Hash
    expect(route_response[:data][:attributes][:forecast]).to have_key :summary
    expect(route_response[:data][:attributes][:forecast][:summary]).to be_a String
    expect(route_response[:data][:attributes][:forecast]).to have_key :temperature
    expect(route_response[:data][:attributes][:forecast][:temperature]).to be_a String
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :dt
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :feels_like
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :humidity
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :icon
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :main_description
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :sunrise
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :sunset
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :uvi
    expect(route_response[:data][:attributes][:forecast]).to_not have_key :visibility

    expect(route_response[:data][:attributes][:routes]).to be_an Array
    first_route = route_response[:data][:attributes][:routes][0]
    expect(first_route).to be_a Hash
    expect(first_route).to have_key :name
    expect(first_route[:name]).to be_a String
    expect(first_route).to have_key :type
    expect(first_route[:type]).to be_a String
    expect(first_route).to have_key :rating
    expect(first_route[:rating]).to be_a String
    expect(first_route).to have_key :distance_to_route
    expect(first_route[:distance_to_route]).to be_a String

    expect(first_route).to have_key :location
    expect(first_route[:location]).to be_an Array
    expect(first_route[:location][0]).to be_a String
  end
end
