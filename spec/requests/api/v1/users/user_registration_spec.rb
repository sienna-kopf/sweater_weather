require 'rails_helper'

RSpec.describe 'User Registration Endpoint' do
  describe "user registration details are passed in the body of the post request" do
    describe "successful request" do
      it "creates a user and generates a unique API key for that user", :vcr do
        headers = { "CONTENT_TYPE" => "application/json"}

        body =
        {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }

        post "/api/v1/users", params: JSON.generate(body), headers: headers

        expect(response).to be_successful
        expect(response.content_type).to eq("application/json")

        new_user = JSON.parse(response.body, symbolize_names: true)

        expect(new_user).to be_a Hash
        expect(new_user).to have_key :data

        expect(new_user[:data]).to have_key(:id)
        expect(new_user[:data]).to have_key(:type)
        expect(new_user[:data]).to have_key(:attributes)

        expect(new_user[:data][:id]).to be_a String
        expect(new_user[:data][:type]).to eq("users")
        expect(new_user[:data][:type]).to be_a String

        expect(new_user[:data][:attributes]).to be_a Hash
        expect(new_user[:data][:attributes]).to have_key :email
        expect(new_user[:data][:attributes]).to have_key :api_key
        expect(new_user[:data][:attributes]).to_not have_key :password
        expect(new_user[:data][:attributes]).to_not have_key :password_confirmation
      end
    end
    describe "unsuccessful request" do
      it "returns the appropriate 400 level status code and body w/ description of failure", :vcr do
        headers = { "CONTENT_TYPE" => "application/json"}

        body =
        {
          "email": "whatever1@example.com",
          "password": "password",
          "password_confirmation": "wrong_password"
        }

        post "/api/v1/users", params: JSON.generate(body), headers: headers

        expect(response.content_type).to eq("application/json")
        expect(response.status).to eq(400)

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to be_a Hash
        expect(error_response).to have_key :data
        expect(error_response[:data]).to have_key :id
        expect(error_response[:data][:id]).to eq(nil)
        expect(error_response[:data]).to have_key :type
        expect(error_response[:data][:type]).to eq("errors")
        expect(error_response[:data]).to have_key :attributes
        expect(error_response[:data][:attributes]).to be_a Hash
        expect(error_response[:data][:attributes]).to have_key :error_messages
        expect(error_response[:data][:attributes][:error_messages]).to eq("Password confirmation doesn't match Password")
      end
    end
  end
end
