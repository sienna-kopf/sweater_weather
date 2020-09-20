require 'rails_helper'

RSpec.describe "Forecast Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    describe "converts the location into lat and long" do
      it "returns weather for that location current, hourly, and daily" do
        location = "denver, co"

        get "/api/v1/forecast?location=#{location}"

        expect(response).to be_successful

        complete_forecast = JSON.parse(response.body, symbolize_names: true)

        expect(complete_forecast).to be_a Hash
        expect(complete_forecast).to have_key :data
        expect(complete_forecast[:data]).to be_a Hash
        expect(complete_forecast[:data]).to have_key :current_forecast
        expect(complete_forecast[:data]).to have_key :hourly_forecast
        expect(complete_forecast[:data]).to have_key :daily_forecast

        expect(complete_forecast[:data][:current_forecast]).to be_a Hash
        expect(complete_forecast[:data][:current_forecast]).to have_key :type
        expect(complete_forecast[:data][:current_forecast]).to have_key :attributes

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :dt
        expect(complete_forecast[:data][:current_forecast][:attributes][:dt]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :sunrise
        expect(complete_forecast[:data][:current_forecast][:attributes][:sunrise]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :sunset
        expect(complete_forecast[:data][:current_forecast][:attributes][:sunset]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :temp
        expect(complete_forecast[:data][:current_forecast][:attributes][:temp]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :feels_like
        expect(complete_forecast[:data][:current_forecast][:attributes][:feels_like]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :humidity
        expect(complete_forecast[:data][:current_forecast][:attributes][:humidity]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :uvi
        expect(complete_forecast[:data][:current_forecast][:attributes][:uvi]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :visibility
        expect(complete_forecast[:data][:current_forecast][:attributes][:visibility]).to be_a Integer

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :main_description
        expect(complete_forecast[:data][:current_forecast][:attributes][:main_description]).to be_a String

        expect(complete_forecast[:data][:current_forecast][:attributes]).to have_key :icon
        expect(complete_forecast[:data][:current_forecast][:attributes][:icon]).to be_a String

        expect(complete_forecast[:data][:hourly_forecast]).to be_a Hash
        expect(complete_forecast[:data][:hourly_forecast]).to have_key :type
        expect(complete_forecast[:data][:hourly_forecast]).to have_key :attributes

        expect(complete_forecast[:data][:hourly_forecast][:attributes]).to be_an Array
        expect(complete_forecast[:data][:hourly_forecast][:attributes].size).to eq(8)
        current_hour = complete_forecast[:data][:hourly_forecast][:attributes][0]

        expect(current_hour).to be_a Hash
        expect(current_hour).to have_key :dt
        expect(current_hour[:dt]).to be_a Integer

        expect(current_hour).to have_key :temp
        expect(current_hour[:temp]).to be_a Integer

        expect(current_hour).to have_key :icon
        expect(current_hour[:icon]).to be_a String

        expect(complete_forecast[:data][:daily_forecast]).to be_a Hash
        expect(complete_forecast[:data][:daily_forecast]).to have_key :type
        expect(complete_forecast[:data][:daily_forecast]).to have_key :attributes

        expect(complete_forecast[:data][:daily_forecast][:attributes]).to be_an Array
        expect(complete_forecast[:data][:daily_forecast][:attributes].size).to eq(6)
        current_day = complete_forecast[:data][:daily_forecast][:attributes][0]
        expect(current_day).to be_a Hash

        expect(current_day).to have_key :dt
        expect(current_day[:dt]).to be_a Integer

        expect(current_day).to have_key :temp
        expect(current_day[:temp]).to be_a Integer

        expect(current_day).to have_key :temp_min
        expect(current_day[:temp_min]).to be_a Integer

        expect(current_day).to have_key :temp_max
        expect(current_day[:temp_max]).to be_a Integer

        expect(current_day).to have_key :main_description
        expect(current_day[:main_description]).to be_a String

        expect(current_day).to have_key :icon
        expect(current_day[:icon]).to be_a String

        expect(current_day).to have_key :rain
        expect(current_day).to have_key :snow
      end
    end
  end
end
