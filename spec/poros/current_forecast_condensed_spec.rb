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

    expect(condensed_forecast).to be_a CurrentForecastCondensed
    expect(condensed_forecast.temperature).to be_a String
    expect(condensed_forecast.temperature).to eq("68")
    expect(condensed_forecast.summary).to be_a String
    expect(condensed_forecast.summary).to eq("scattered clouds")
  end
end
