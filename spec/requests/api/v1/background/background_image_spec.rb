require 'rails_helper'

RSpec.describe "Background Image Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    it "returns a background image that matches that location" do
      location = "denver, co"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      # response.content_type == "application/json"

      # background_image = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
