require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'instance methods' do
    before :each do
      lat = 39.738453
      lon = -104.984853
      @facade = ForecastFacade.new(lat, lon)
    end
    describe '#response_forecast' do
      it "calls the open weather API to return current, hourly, and daily weather", :vcr do
        response = @facade.response_forecast
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
      end
    end
    describe '#current_forecast' do
      it "instantiates a current forecast object with current forecast coming through as the payload", :vcr do
        response = @facade.current_forecast

        expect(response).to be_a CurrentForecast
        expect(response.dt).to be_a Integer
        expect(response.sunrise).to be_a Integer
        expect(response.sunset).to be_a Integer
        expect(response.temp).to be_a Integer
        expect(response.feels_like).to be_a Integer
        expect(response.humidity).to be_a Integer
        expect(response.uvi).to be_a Integer
        expect(response.visibility).to be_a Integer
        expect(response.main_description).to be_a String
        expect(response.description).to be_a String
        expect(response.icon).to be_a String
      end
    end
    describe '#hourly_forecast' do
      it "instantiates a hourly forecast object with hourly forecast coming through as the payload", :vcr do
        response = @facade.hourly_forecast[0]

        expect(response).to be_a HourlyForecast
        expect(response.dt).to be_a Integer
        expect(response.temp).to be_a Integer
        expect(response.icon).to be_a String
      end
    end
    describe '#daily_forecast' do
      it "instantiates a daily forecast object with daily forecast coming through as the payload", :vcr do
        response = @facade.daily_forecast[0]

        expect(response).to be_a DailyForecast
        expect(response.dt).to be_a Integer
        expect(response.temp).to be_a Integer
        expect(response.temp_min).to be_a Integer
        expect(response.temp_max).to be_a Integer
        expect(response.main_description).to be_a String
        expect(response.icon).to be_a String
      end
    end
    describe '#weather' do
      it "combines current daily and hourly forecast to create one weather obj", :vcr do
        response = @facade.weather

        expect(response).to be_a Weather
        expect(response.current_forecast).to be_a CurrentForecast
        expect(response.hourly_forecast).to be_an Array
        expect(response.hourly_forecast[0]).to be_a HourlyForecast
        expect(response.daily_forecast).to be_an Array
        expect(response.daily_forecast[0]).to be_a DailyForecast
      end
    end
  end
end
