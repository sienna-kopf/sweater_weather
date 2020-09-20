require 'rails_helper'

RSpec.describe "Forecast Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    describe "converts the location into lat and long" do
      it "returns weather for that location current, hourly, and daily" do
        location = "denver, co"

        get "/api/v1/forecast?location=#{location}"

        expect(response).to be_successful
        response.content_type == "application/json"

        complete_forecast = JSON.parse(response.body, symbolize_names: true)

        expect(complete_forecast).to be_a Hash
        expect(complete_forecast).to have_key :data
        expect(complete_forecast[:data]).to be_a Hash
        expect(complete_forecast[:data]).to have_key :id
        expect(complete_forecast[:data][:id]).to eq(nil)
        expect(complete_forecast[:data]).to have_key :type
        expect(complete_forecast[:data][:type]).to eq('forecast')
        expect(complete_forecast[:data]).to have_key :attributes

        expect(complete_forecast[:data][:attributes]).to be_a Hash
        expect(complete_forecast[:data][:attributes]).to have_key :current_forecast
        expect(complete_forecast[:data][:attributes]).to have_key :hourly_forecast
        expect(complete_forecast[:data][:attributes]).to have_key :daily_forecast

        expect(complete_forecast[:data][:attributes][:current_forecast]).to be_a Hash

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :dt
        expect(complete_forecast[:data][:attributes][:current_forecast][:dt]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :sunrise
        expect(complete_forecast[:data][:attributes][:current_forecast][:sunrise]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :sunset
        expect(complete_forecast[:data][:attributes][:current_forecast][:sunset]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :temp
        expect(complete_forecast[:data][:attributes][:current_forecast][:temp]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :feels_like
        expect(complete_forecast[:data][:attributes][:current_forecast][:feels_like]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :humidity
        expect(complete_forecast[:data][:attributes][:current_forecast][:humidity]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :uvi
        expect(complete_forecast[:data][:attributes][:current_forecast][:uvi]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :visibility
        expect(complete_forecast[:data][:attributes][:current_forecast][:visibility]).to be_a Integer

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :main_description
        expect(complete_forecast[:data][:attributes][:current_forecast][:main_description]).to be_a String

        expect(complete_forecast[:data][:attributes][:current_forecast]).to have_key :icon
        expect(complete_forecast[:data][:attributes][:current_forecast][:icon]).to be_a String

        expect(complete_forecast[:data][:attributes][:current_forecast]).to_not have_key :pressure
        expect(complete_forecast[:data][:attributes][:current_forecast]).to_not have_key :dew_point
        expect(complete_forecast[:data][:attributes][:current_forecast]).to_not have_key :clouds
        expect(complete_forecast[:data][:attributes][:current_forecast]).to_not have_key :wind_speed
        expect(complete_forecast[:data][:attributes][:current_forecast]).to_not have_key :wind_deg

        expect(complete_forecast[:data][:attributes][:hourly_forecast]).to be_an Array
        expect(complete_forecast[:data][:attributes][:hourly_forecast].size).to eq(8)
        current_hour = complete_forecast[:data][:attributes][:hourly_forecast][0]

        expect(current_hour).to be_a Hash
        expect(current_hour).to have_key :dt
        expect(current_hour[:dt]).to be_a Integer

        expect(current_hour).to have_key :temp
        expect(current_hour[:temp]).to be_a Integer

        expect(current_hour).to have_key :icon
        expect(current_hour[:icon]).to be_a String

        expect(current_hour).to_not have_key :feels_like
        expect(current_hour).to_not have_key :pressure
        expect(current_hour).to_not have_key :humidity
        expect(current_hour).to_not have_key :dew_point
        expect(current_hour).to_not have_key :clouds
        expect(current_hour).to_not have_key :visibility
        expect(current_hour).to_not have_key :wind_speed
        expect(current_hour).to_not have_key :wind_deg
        expect(current_hour).to_not have_key :main_description
        expect(current_hour).to_not have_key :description
        expect(current_hour).to_not have_key :pop

        expect(complete_forecast[:data][:attributes][:daily_forecast]).to be_an Array
        expect(complete_forecast[:data][:attributes][:daily_forecast].size).to eq(6)
        current_day = complete_forecast[:data][:attributes][:daily_forecast][0]

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

        expect(current_day).to_not have_key :sunrise
        expect(current_day).to_not have_key :sunset
        expect(current_day).to_not have_key :humidity
        expect(current_day).to_not have_key :night_temp
        expect(current_day).to_not have_key :evening_temp
        expect(current_day).to_not have_key :morning_temp
        expect(current_day).to_not have_key :feels_like_day_temp
        expect(current_day).to_not have_key :feels_like_night_temp
        expect(current_day).to_not have_key :feels_like_eve_temp
        expect(current_day).to_not have_key :feels_like_morn_temp
        expect(current_day).to_not have_key :pressure
        expect(current_day).to_not have_key :humidity
        expect(current_day).to_not have_key :dew_point
        expect(current_day).to_not have_key :wind_speed
        expect(current_day).to_not have_key :wind_deg
        expect(current_day).to_not have_key :description
        expect(current_day).to_not have_key :clouds
        expect(current_day).to_not have_key :pop
        expect(current_day).to_not have_key :uvi
      end
    end
  end
end
