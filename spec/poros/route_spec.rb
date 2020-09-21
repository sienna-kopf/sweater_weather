require 'rails_helper'

describe Route do
  it 'exists' do
    attrs =
    {
      "name": "The Yellow Spur",
      "type": "Trad",
      "rating": "5.9+",
      "location": [
          "Colorado",
          "Boulder",
          "Eldorado Canyon SP",
          "Redgarden Wall",
          "Redgarden - Tower One"
      ],
      "longitude": -105.286,
      "latitude": 39.9319
    }

    route = Route.new(attrs)

    expect(route).to be_a Route
    expect(route.name).to eq("The Yellow Spur")
    expect(route.name).to be_a String
    expect(route.type).to eq("Trad")
    expect(route.type).to be_a String
    expect(route.rating).to eq("5.9+")
    expect(route.rating).to be_a String
    expect(route.location).to eq(["Colorado", "Boulder", "Eldorado Canyon SP", "Redgarden Wall", "Redgarden - Tower One"])
    expect(route.location).to be_an Array
    expect(route.longitude).to eq(-105.286)
    expect(route.longitude).to be_a Float
    expect(route.latitude).to eq(39.9319)
    expect(route.latitude).to be_a Float
  end
end
