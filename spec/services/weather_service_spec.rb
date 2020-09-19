require 'rails_helper'

RSpec.describe WeatherService do
  context 'instance methods' do
    context '#forecast' do
      it "takes in a location(lat, lon) and returns current, hourly and daily weather info" do
        lat = 39.738453
        lon = -104.984853
        service = WeatherService.new
        response = service.forecast(lat, lon)
        expect(response).to be_a Hash
        expect(response).to have_key :current
        expect(response).to have_key :hourly
        expect(response).to have_key :daily

        expect(response[:current]).to be_a Hash
        expect(response[:current]).to have_key :dt
        expect(response[:current][:dt]).to be_a Integer

        expect(response[:current]).to have_key :sunrise
        expect(response[:current][:sunrise]).to be_a Integer

        expect(response[:current]).to have_key :sunset
        expect(response[:current][:sunset]).to be_a Integer

        expect(response[:current]).to have_key :temp
        expect(response[:current][:temp]).to be_a Float

        expect(response[:current]).to have_key :feels_like
        expect(response[:current][:feels_like]).to be_a Float

        expect(response[:current]).to have_key :humidity
        expect(response[:current][:humidity]).to be_a Integer

        expect(response[:current]).to have_key :uvi
        expect(response[:current][:uvi]).to be_a Float

        expect(response[:current]).to have_key :visibility
        expect(response[:current][:visibility]).to be_a Integer

        expect(response[:current]).to have_key :weather
        expect(response[:current][:weather]).to be_a Array
        expect(response[:current][:weather][0]).to be_a Hash
        expect(response[:current][:weather][0]).to have_key :main
        expect(response[:current][:weather][0][:main]).to be_a String
        expect(response[:current][:weather][0]).to have_key :description
        expect(response[:current][:weather][0][:description]).to be_a String
        expect(response[:current][:weather][0]).to have_key :icon
        expect(response[:current][:weather][0][:icon]).to be_a String

        expect(response[:hourly]).to be_an Array
        expect(response[:hourly].size).to eq(48)
        current_hour = response[:hourly][0]
        expect(current_hour).to be_a Hash
        expect(current_hour).to have_key :dt
        expect(current_hour[:dt]).to be_a Integer

        expect(current_hour).to have_key :temp
        expect(current_hour[:temp]).to be_a Float

        expect(current_hour).to have_key :weather
        expect(current_hour[:weather]).to be_an Array
        expect(current_hour[:weather][0]).to be_a Hash
        expect(current_hour[:weather][0]).to have_key :icon
        expect(current_hour[:weather][0][:icon]).to be_a String

        expect(response[:daily]).to be_an Array
        expect(response[:daily].size).to eq(8)
        current_day = response[:daily][0]
        expect(current_day).to be_a Hash
        expect(current_day).to have_key :dt

        expect(current_day).to have_key :temp
        expect(current_day[:temp]).to be_a Hash
        expect(current_day[:temp]).to have_key :min
        expect(current_day[:temp][:min]).to be_a Float
        expect(current_day[:temp]).to have_key :max
        expect(current_day[:temp][:max]).to be_a Float

        expect(current_day).to have_key :weather
        expect(current_day[:weather]).to be_an Array
        expect(current_day[:weather][0]).to be_a Hash
        expect(current_day[:weather][0]).to have_key :main
        expect(current_day[:weather][0][:main]).to be_a String
        expect(current_day[:weather][0]).to have_key :icon
        expect(current_day[:weather][0][:icon]).to be_a String

        # expect(current_day).to have_key :rain
        # expect(current_day).to have_key :snow
      end
    end
  end
end
