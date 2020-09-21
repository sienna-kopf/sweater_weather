require 'rails_helper'

RSpec.describe MapQuestService do
  context 'instance methods' do
    context '#lat_long' do
      it "takes in a location and transforms it into lat and long coordinates" do
        location = "denver, co"
        service = MapQuestService.new
        response = service.lat_long(location)
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
    context '#distance_to_route' do
      it "takes in a location and coordinates in latitude and longitude and determines the distance/time between locations" do
        location = "erwin, tn"
        lat = 35.8536
        lon = -82.2401
        service = MapQuestService.new
        response = service.distance_to_route(location, lat, lon)
        expect(response).to be_a Hash
        expect(response[:route]).to be_a Hash
        expect(response[:route]).to have_key :distance
        expect(response[:route][:distance]).to be_a Float
      end
    end
  end
end
