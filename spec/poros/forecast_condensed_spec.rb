require 'rails_helper'

describe ForecastCondensed do
  it 'exists' do
    attrs = {
        "temp": 67.75,
        "weather": [
            {
                "description": "scattered clouds"
            }
        ]
    }

    condensed_forecast = ForecastCondensed.new(attrs)

    expect(condensed_forecast).to be_a ForecastCondensed
    expect(condensed_forecast.temperature).to be_a String
    expect(condensed_forecast.temperature).to eq("68")
    expect(condensed_forecast.summary).to be_a String
    expect(condensed_forecast.summary).to eq("scattered clouds")
  end
end
