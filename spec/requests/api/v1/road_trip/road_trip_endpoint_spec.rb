require 'rails_helper'

RSpec.describe "Road Trip Endpoint", type: :request do
  describe "takes in origin and destination locations in the form city, state code" do
    describe "collects information on time travel between the locations" do
      describe "and returns temperature and summary of weather at destination based on arrival time"
      it "returns the origin and destination locations, travel time, and arrival forecast" do
        headers = { "CONTENT_TYPE" => "application/json"}

        body =
        {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }

        post "/api/v1/road_trip", params: JSON.generate(body), headers: headers

        expect(response).to be_successful
        expect(response.content_type).to eq("application/json")

        road_trip_response = JSON.parse(response.body, symbolize_names: true)

        expect(road_trip_response).to be_a Hash
        expect(road_trip_response).to have_key :data
        expect(road_trip_response[:data]).to be_a Hash
        expect(road_trip_response[:data]).to have_key :id
        expect(road_trip_response[:data][:id]).to eq(nil)
        expect(road_trip_response[:data]).to have_key :type
        expect(road_trip_response[:data][:type]).to eq("road_trip")
        expect(road_trip_response[:data]).to have_key :attributes

        expect(road_trip_response[:data][:attributes]).to be_a Hash
        expect(road_trip_response[:data][:attributes]).to have_key :origin
        expect(road_trip_response[:data][:attributes]).to have_key :destination
        expect(road_trip_response[:data][:attributes]).to have_key :travel_time
        expect(road_trip_response[:data][:attributes]).to have_key :arrival_forecast

        expect(road_trip_response[:data][:attributes][:origin]).to be_a String
        expect(road_trip_response[:data][:attributes][:origin]).to eq('Denver,CO')

        expect(road_trip_response[:data][:attributes][:destination]).to be_a String
        expect(road_trip_response[:data][:attributes][:destination]).to eq('Pueblo,CO')

        expect(road_trip_response[:data][:attributes][:travel_time]).to be_a String
        # expect(road_trip_response[:data][:attributes][:travel_time]).to eq()

        expect(road_trip_response[:data][:attributes][:arrival_forecast]).to be_a Hash
        expect(road_trip_response[:data][:attributes][:arrival_forecast]).to have_key :summary
        expect(road_trip_response[:data][:attributes][:arrival_forecast][:summary]).to be_a String
        expect(road_trip_response[:data][:attributes][:arrival_forecast]).to have_key :temperature
        expect(road_trip_response[:data][:attributes][:arrival_forecast][:temperature]).to be_a String

        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :dt
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :feels_like
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :humidity
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :icon
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :main_description
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :sunrise
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :sunset
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :uvi
        expect(road_trip_response[:data][:attributes][:forecast]).to_not have_key :visibility
      end
    end
  end
end
