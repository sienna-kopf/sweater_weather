require 'rails_helper'

RSpec.describe UsersSerializer do
  xit "serializes successful user data" do
    serialized = UsersSerializer.new(user).to_json

    response = JSON.parse(serialized, symbolize_names: true)

    expect(response).to be_a Hash
    expect(response).to have_key :data

    expect(response[:data]).to have_key(:id)
    expect(response[:data]).to have_key(:type)
    expect(response[:data]).to have_key(:attributes)

    expect(response[:data][:id]).to be_a String
    expect(response[:data][:type]).to eq("users")
    expect(response[:data][:type]).to be_a String

    expect(response[:data][:attributes]).to be_a Hash
    expect(response[:data][:attributes]).to have_key :email
    expect(response[:data][:attributes]).to have_key :api_key
    expect(response[:data][:attributes]).to_not have_key :password
    expect(response[:data][:attributes]).to_not have_key :password_confirmation
  end
end
