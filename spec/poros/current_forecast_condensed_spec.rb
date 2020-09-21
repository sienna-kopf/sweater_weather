require 'rails_helper'

describe CurrentForecastCondensed do
  it 'exists' do
    attrs = {
        "temp": 67.75,
        "weather": [
            {
                "description": "scattered clouds"
            }
        ]
    }

    condensed_forecast = CurrentForecastCondensed.new(attrs)

    expect(current).to be_a CurrentForecastCondensed
    expect(current.temperature).to be_a Integer
    expect(current.temperature).to eq(68)
    expect(current.summary).to be_a String
    expect(current.summary).to eq("scattered clouds")
    expect(current.icon).to eq("03d")
  end
end
