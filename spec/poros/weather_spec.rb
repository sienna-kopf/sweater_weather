require 'rails_helper'

RSpec.describe Weather do
  it 'exists' do
    current_attrs = {
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
            "dt": 1600520400,
            "temp": 67.75,
            "weather": [
                {
                    "icon": "04d"
                }
            ]
        },
        {
                "dt": 1600621200,
                "temp": 75.15,
                "weather": [
                    {
                        "icon": "04d"
                    }
                ]
            }
      ]

    daily_array =
    [
      {
      "dt": 1600624800,
      "temp": {
          "day": 74.91,
          "min": 66.65,
          "max": 81.79
      },
      "weather": [
          {
              "main": "Rain",
              "icon": "10d"
          }
        ],
        "rain": 0.12,
        "snow": 0.34
      },
      {
        "dt": 1600624800,
        "temp": {
            "day": 74.91,
            "min": 66.65,
            "max": 81.79
        },
        "weather": [
            {
                "main": "Rain",
                "icon": "10d"
            }
        ],
        "rain": 0.12,
        "snow": 0.34
      }
    ]


    daily = daily_array.map do |day|
      DailyForecast.new(day)
    end

    hourly = hourly_array.map do |hour|
      HourlyForecast.new(hour)
    end

    current = CurrentForecast.new(current_attrs)

    weather = Weather.new(current, hourly, daily)

    expect(weather).to be_a Weather
    expect(weather.current_forecast).to be_a CurrentForecast
    expect(weather.hourly_forecast).to be_an Array
    expect(weather.hourly_forecast[0]).to be_a HourlyForecast
    expect(weather.daily_forecast).to be_an Array
    expect(weather.daily_forecast[0]).to be_a DailyForecast
  end
end
