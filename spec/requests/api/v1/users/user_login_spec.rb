require 'rails_helper'

RSpec.describe 'User Login Endpoint' do
  describe "user login details are passed in the body of the post request" do
    describe "successful request" do
      it "returnes a 200 response with the users api key" do
        headers_registration = { "CONTENT_TYPE" => "application/json"}

        body_reg =
        {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }

        post "/api/v1/users", params: JSON.generate(body_reg), headers: headers_registration

        headers = { "CONTENT_TYPE" => "application/json"}

        body =
        {
          "email": "whatever@example.com",
          "password": "password"
        }

        post "/api/v1/sessions", params: JSON.generate(body), headers: headers

        expect(response).to be_successful
        expect(response.content_type).to eq("application/json")

        user = JSON.parse(response.body, symbolize_names: true)

        expect(user).to be_a Hash
        expect(user).to have_key :data

        expect(user[:data]).to have_key(:id)
        expect(user[:data]).to have_key(:type)
        expect(user[:data]).to have_key(:attributes)

        expect(user[:data][:id]).to be_a String
        expect(user[:data][:type]).to eq("users")
        expect(user[:data][:type]).to be_a String

        expect(user[:data][:attributes]).to be_a Hash
        expect(user[:data][:attributes]).to have_key :email
        expect(user[:data][:attributes]).to have_key :api_key
        expect(user[:data][:attributes]).to_not have_key :password
        expect(user[:data][:attributes]).to_not have_key :password_confirmation
      end
    end
    describe "unsuccessful request" do
      it "returns the appropriate 400 level status code and body w/ description of failure" do
        headers_registration = { "CONTENT_TYPE" => "application/json"}

        body_reg =
        {
          "email": "whatever1@example.com",
          "password": "password",
          "password_confirmation": "password"
        }

        post "/api/v1/users", params: JSON.generate(body_reg), headers: headers_registration

        headers = { "CONTENT_TYPE" => "application/json"}

        body =
        {
          "email": "whatever1@example.com",
          "password": "not_the_password"
        }

        post "/api/v1/sessions", params: JSON.generate(body), headers: headers

        expect(response.content_type).to eq("application/json")

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to be_a Hash
        expect(error_response).to have_key :errors
        expect(error_response[:errors]).to be_a Hash
        expect(error_response[:errors]).to have_key :status
        expect(error_response[:errors][:status]).to eq(400)
        expect(error_response[:errors]).to have_key :error_messages
        expect(error_response[:errors][:error_messages]).to be_an Array
        expect(error_response[:errors][:error_messages]).to include("credentials are bad")
      end
    end
  end
end
