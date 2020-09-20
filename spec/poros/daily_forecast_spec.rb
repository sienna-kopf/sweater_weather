require 'rails_helper'

describe DailyForecast do
  it 'exists' do
    attrs =
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

    daily = DailyForecast.new(attrs)

    expect(daily).to be_a DailyForecast
    expect(daily.dt).to be_a Integer
    expect(daily.dt).to eq(1600624800)
    expect(daily.temp).to be_a Integer
    expect(daily.temp).to eq(75)
    expect(daily.temp_min).to be_a Integer
    expect(daily.temp_min).to eq(67)
    expect(daily.temp_max).to be_a Integer
    expect(daily.temp_max).to eq(82)
    expect(daily.main_description).to be_a String
    expect(daily.main_description).to eq("Rain")
    expect(daily.icon).to be_a String
    expect(daily.icon).to eq("10d")
    expect(daily.rain).to be_a Float
    expect(daily.rain).to eq(0.12)
    expect(daily.snow).to be_a Float
    expect(daily.snow).to eq(0.34)
  end
end
