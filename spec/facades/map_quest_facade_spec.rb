require 'rails_helper'

RSpec.describe MapQuestFacade do
  describe 'instance methods' do
    before :each do
      location = "denver, co"
      @facade = MapQuestFacade.new(location)
    end
    describe '#response_lat_long' do
      it "calls the map quest service to retrieve lat long data for a particular location", :vcr do
        response = @facade.response_lat_long
        expect(response).to be_a Hash
        expect(response[:results]).to be_an Array
        target_result = response[:results][0]
        expect(target_result).to have_key :locations
        expect(target_result[:locations]).to be_an Array
        target_location = target_result[:locations][0]
        expect(target_location).to have_key :latLng
        expect(target_location[:latLng]).to have_key :lat
        expect(target_location[:latLng]).to have_key :lng

        expect(target_location[:latLng][:lat]).to be_a Float
        expect(target_location[:latLng][:lng]).to be_a Float

        expect(target_location[:latLng][:lat]).to eq(39.738453)
        expect(target_location[:latLng][:lng]).to eq(-104.984853)
      end
    end
    describe '#lat_long' do
      it "instantiates a coordinates poro passing in response payload as data", :vcr do
        response = @facade.lat_long

        expect(response).to be_a Coordinate
        expect(response.lat).to be_a Float
        expect(response.lon).to be_a Float

        expect(response.lat).to eq(39.738453)
        expect(response.lon).to eq(-104.984853)
      end
    end
    describe "#response_road_trip" do
      it 'calls the map quest service to determine the travel time between an origin and destination', :vcr do
        origin = "denver, co"
        destination = "pueblo, co"
        facade = MapQuestFacade.new(origin, destination)

        response = facade.response_road_trip
        expect(response).to be_a Hash
        expect(response[:route]).to be_a Hash
        expect(response[:route]).to have_key :formattedTime
        expect(response[:route][:formattedTime]).to be_a String
      end
    end
    describe "#trip" do
      it 'instantiates a trip poro based on the payload returned by the map quest call', :vcr do
        origin = "denver, co"
        destination = "pueblo, co"
        facade = MapQuestFacade.new(origin, destination)

        response = facade.trip
        expect(response).to be_a Trip
        expect(response.travel_time).to be_a String
      end
    end
  end
end
