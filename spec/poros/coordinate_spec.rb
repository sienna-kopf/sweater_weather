require 'rails_helper'

describe Coordinate do
  it 'exists' do
    attrs = { :latLng =>
      {
        :lat => 39.738453,
        :lng => -104.984853
      }
    }

    coordinate = Coordinate.new(attrs)

    expect(coordinate).to be_a Coordinate
    expect(coordinate.lon).to be_a Float
    expect(coordinate.lat).to be_a Float
    expect(coordinate.lon).to eq(-104.984853)
    expect(coordinate.lat).to eq(39.738453)
  end
end
