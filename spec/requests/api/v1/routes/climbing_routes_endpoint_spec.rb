require 'rails_helper'

RSpec.describe "Climbing Routes Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    describe "collects information on current weather and routes near that location" do
      describe "and finds the distance between those routes and the original location"
      it "returns current forecast, name, type rating and location of each route and travel time to each route" do
        location = "erwin, tn"

        get "/api/v1/climbing_routes?location=#{location}"

        expect(response).to be_successful
        response.content_type == "application/json"

        route_response = JSON.parse(response.body, symbolize_names: true)

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

        expect(first_route).to_not have_key :id
        expect(first_route).to_not have_key :stars
        expect(first_route).to_not have_key :starVotes
        expect(first_route).to_not have_key :pitches
        expect(first_route).to_not have_key :url
        expect(first_route).to_not have_key :imgSqSmall
        expect(first_route).to_not have_key :imgSmall
        expect(first_route).to_not have_key :imgSmallMed
        expect(first_route).to_not have_key :imgMedium
      end
    end
  end
end
