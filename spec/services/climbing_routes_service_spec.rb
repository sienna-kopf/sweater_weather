require 'rails_helper'

RSpec.describe ClimbingRoutesService do
  context 'instance methods' do
    context '#routes' do
      it "takes in lat and long and returns an array of routes nearby" do
        lat = 40.03
        lon = -105.25
        service = ClimbingRoutesService.new
        response = service.routes(lat, lon)
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
        target_location = target_route[:locations][0]
      end
    end
  end
end
