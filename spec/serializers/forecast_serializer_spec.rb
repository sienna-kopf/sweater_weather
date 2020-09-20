require 'rails_helper'

RSpec.describe ForecastSerializer do
  describe 'instance methods' do
    describe '#data_hash' do
      it '#serializes current, hourly, and daily weather forecasts into one response' do
        current_attrs =
            {
            "dt": 1600615343,
            "sunrise": 1600605971,
            "sunset": 1600650010,
            "temp": 67.75,
            "feels_like": 56.93,
            "humidity": 26,
            "uvi": 6.76,
            "visibility": 10000,
            "weather": [
                {
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
              ]
            }

        hourly_array =
        [
            {
                "dt": 1600614000,
                "temp": 67.75,
                "weather": [
                    {
                        "icon": "03d"
                    }
                ]
            },
            {
                "dt": 1600617600,
                "temp": 72.16,
                "weather": [
                    {
                        "icon": "03d"
                    }
                ]
            },
            {
                "dt": 1600621200,
                "temp": 77.52,
                "weather": [
                    {
                        "icon": "03d"
                    }
                ]
            }
          ]

        daily_array =
        [
            {
                "dt": 1600624800,
                "temp": {
                    "day": 76.23,
                    "min": 66.65,
                    "max": 82.08
                },
                "weather": [
                    {
                        "main": "Rain",
                        "icon": "10d"
                    }
                ],
                "rain": 0.12
            },
            {
                "dt": 1600711200,
                "temp": {
                    "day": 83.34,
                    "min": 67.37,
                    "max": 86.27
                },
                "weather": [
                    {
                        "main": "Clear",
                        "icon": "01d"
                    }
                ]
            }
          ]

        current_forecast = CurrentForecast.new(current_attrs)
        hourly_forecast = hourly_array.map do |hourly_forecast|
          HourlyForecast.new(hourly_forecast)
        end
        daily_forecast = daily_array.map do |daily_forecast|
          DailyForecast.new(daily_forecast)
        end

        weather = Weather.new(current_forecast, hourly_forecast, daily_forecast)

        forecast_payload = ForecastSerializer.new(weather).to_json

        response = JSON.parse(forecast_payload, symbolize_names: true)

        expect(response).to be_a Hash
        expect(response).to have_key :data
        expect(response[:data]).to be_a Hash
        expect(response[:data]).to have_key :id
        expect(response[:data][:id]).to eq(nil)
        expect(response[:data]).to have_key :type
        expect(response[:data][:type]).to eq('forecast')
        expect(response[:data]).to have_key :attributes

        expect(response[:data][:attributes]).to be_a Hash
        expect(response[:data][:attributes]).to have_key :current_forecast
        expect(response[:data][:attributes]).to have_key :hourly_forecast
        expect(response[:data][:attributes]).to have_key :daily_forecast

        expect(response[:data][:attributes][:current_forecast]).to be_a Hash

        expect(response[:data][:attributes][:current_forecast]).to have_key :dt
        expect(response[:data][:attributes][:current_forecast][:dt]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :sunrise
        expect(response[:data][:attributes][:current_forecast][:sunrise]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :sunset
        expect(response[:data][:attributes][:current_forecast][:sunset]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :temp
        expect(response[:data][:attributes][:current_forecast][:temp]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :feels_like
        expect(response[:data][:attributes][:current_forecast][:feels_like]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :humidity
        expect(response[:data][:attributes][:current_forecast][:humidity]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :uvi
        expect(response[:data][:attributes][:current_forecast][:uvi]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :visibility
        expect(response[:data][:attributes][:current_forecast][:visibility]).to be_a Integer

        expect(response[:data][:attributes][:current_forecast]).to have_key :main_description
        expect(response[:data][:attributes][:current_forecast][:main_description]).to be_a String

        expect(response[:data][:attributes][:current_forecast]).to have_key :icon
        expect(response[:data][:attributes][:current_forecast][:icon]).to be_a String

        expect(response[:data][:attributes][:hourly_forecast]).to be_an Array
        expect(response[:data][:attributes][:hourly_forecast].size).to eq(3)
        current_hour = response[:data][:attributes][:hourly_forecast][0]

        expect(current_hour).to be_a Hash
        expect(current_hour).to have_key :dt
        expect(current_hour[:dt]).to be_a Integer

        expect(current_hour).to have_key :temp
        expect(current_hour[:temp]).to be_a Integer

        expect(current_hour).to have_key :icon
        expect(current_hour[:icon]).to be_a String

        expect(response[:data][:attributes][:daily_forecast]).to be_an Array
        expect(response[:data][:attributes][:daily_forecast].size).to eq(2)
        current_day = response[:data][:attributes][:daily_forecast][0]

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
