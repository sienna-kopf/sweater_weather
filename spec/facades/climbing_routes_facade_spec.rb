require 'rails_helper'

RSpec.describe ClimbingRoutesFacade do
  describe 'instance methods' do
    before :each do
      lat = 39.738453
      lon = -104.984853
      location = "erwin, tn"
      @facade = ClimbingRoutesFacade.new(lat, lon, location)
    end
    describe '#response_routes' do
      it "calls the mountain Project Api to return a list of routes near that location" do
        response = @facade.response_routes

        expect(response).to be_a Hash
        expect(response[:routes]).to be_an Array
        target_route = response[:routes][0]
        expect(target_route).to have_key :name
        expect(target_route[:name]).to be_a String
        expect(target_route).to have_key :type
        expect(target_route[:type]).to be_a String
        expect(target_route).to have_key :rating
        expect(target_route[:rating]).to be_a String
        expect(target_route).to have_key :location
        expect(target_route[:location]).to be_an Array
        expect(target_route).to have_key :longitude
        expect(target_route[:longitude]).to be_a Float
        expect(target_route).to have_key :latitude
        expect(target_route[:latitude]).to be_a Float
      end
    end
    describe '#routes' do
      it "instantiates numerous routes objects with the attributes name, type, rating, location, latitude, and longitude" do
        response = @facade.routes[0]

        expect(response).to be_a Route
        expect(response.name).to be_a String
        expect(response.type).to be_a String
        expect(response.rating).to be_a String
        expect(response.location).to be_an Array
        expect(response.latitude).to be_a Float
        expect(response.longitude).to be_a Float
        expect(response.distance_to_route).to be_a Float
      end
    end
  end
end
