require 'rails_helper'

describe DailyForecast do
  it 'exists' do
    attrs =
    {
            "dt": 1600538400,
            "temp": {
                "day": 299.67,
                "min": 288.44,
                "max": 302.83,
            },
            "weather": [
                {
                    "main": "Rain",
                    "icon": "10d"
                }
            ],
            "rain": 0.59,
            "snow": 0.12
        }

    daily = DailyForecast.new(attrs)

    expect(daily).to be_a DailyForecast
    expect(daily.dt).to be_a Integer
    expect(daily.dt).to eq(1600538400)
    expect(daily.temp).to be_a Integer
    expect(daily.temp).to eq(300)
    expect(daily.temp_min).to be_a Integer
    expect(daily.temp_min).to eq(288)
    expect(daily.temp_max).to be_a Integer
    expect(daily.temp_max).to eq(303)
    expect(daily.main_description).to be_a String
    expect(daily.main_description).to eq("Rain")
    expect(daily.icon).to be_a String
    expect(daily.icon).to eq("10d")
    expect(daily.rain).to be_a Float
    expect(daily.rain).to eq(0.59)
    expect(daily.snow).to be_a Float
    expect(daily.snow).to eq(0.12)
  end
end
