require 'rails_helper'

describe HourlyForecast do
  it 'exists' do
    attrs = {
            "dt": 1600520400,
            "temp": 67.75,
            "weather": [
                {
                    "icon": "04d"
                }
            ]
        }

    hourly = HourlyForecast.new(attrs)

    expect(hourly).to be_a HourlyForecast
    expect(hourly.dt).to be_a Integer
    expect(hourly.dt).to eq(1600520400)
    expect(hourly.temp).to be_a Integer
    expect(hourly.temp).to eq(68)
    expect(hourly.icon).to be_a String
    expect(hourly.icon).to eq("04d")
  end
end
