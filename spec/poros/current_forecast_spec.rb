require 'rails_helper'

describe CurrentForecast do
  it 'exists' do
    attrs = {
        "dt": 1600521082,
        "sunrise": 1600519516,
        "sunset": 1600563710,
        "temp": 288.44,
        "feels_like": 284.71,
        "humidity": 23,
        "uvi": 7.04,
        "visibility": 10000,
        "weather": [
            {
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
            }
        ]
    }

    current = CurrentForecast.new(attrs)

    expect(current).to be_a CurrentForecast
    expect(current.dt).to be_a Integer
    expect(current.dt).to eq(1600521082)
    expect(current.sunrise).to be_a Integer
    expect(current.sunrise).to eq(1600519516)
    expect(current.sunset).to be_a Integer
    expect(current.sunset).to eq(1600563710)
    expect(current.temp).to be_a Integer
    expect(current.temp).to eq(288)
    expect(current.feels_like).to be_a Integer
    expect(current.feels_like).to eq(285)
    expect(current.humidity).to be_a Integer
    expect(current.humidity).to eq(23)
    expect(current.uvi).to be_a Integer
    expect(current.uvi).to eq(7)
    expect(current.visibility).to be_a Integer
    expect(current.visibility).to eq(10000)
    expect(current.main_description).to be_a String
    expect(current.main_description).to eq("Clouds")
    expect(current.description).to be_a String
    expect(current.description).to eq("broken clouds")
    expect(current.icon).to be_a String
    expect(current.icon).to eq("04d")
  end
end
