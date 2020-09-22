require 'rails_helper'

describe Trip do
  it 'exists' do
    attrs = {
        "formattedTime": "01:43:57"
      }

    trip = Trip.new(attrs)

    expect(trip).to be_a Trip
    expect(trip.travel_time).to be_a String
    expect(trip.travel_time).to eq("01:43:57")
  end
end
