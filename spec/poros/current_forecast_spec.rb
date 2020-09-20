require 'rails_helper'

describe CurrentForecast do
  it 'exists' do
    attrs = {
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

    current = CurrentForecast.new(attrs)

    expect(current).to be_a CurrentForecast
    expect(current.dt).to be_a Integer
    expect(current.dt).to eq(1600615343)
    expect(current.sunrise).to be_a Integer
    expect(current.sunrise).to eq(1600605971)
    expect(current.sunset).to be_a Integer
    expect(current.sunset).to eq(1600650010)
    expect(current.temp).to be_a Integer
    expect(current.temp).to eq(68)
    expect(current.feels_like).to be_a Integer
    expect(current.feels_like).to eq(57)
    expect(current.humidity).to be_a Integer
    expect(current.humidity).to eq(26)
    expect(current.uvi).to be_a Integer
    expect(current.uvi).to eq(7)
    expect(current.visibility).to be_a Integer
    expect(current.visibility).to eq(10000)
    expect(current.main_description).to be_a String
    expect(current.main_description).to eq("Clouds")
    expect(current.description).to be_a String
    expect(current.description).to eq("scattered clouds")
    expect(current.icon).to be_a String
    expect(current.icon).to eq("03d")
  end
end
