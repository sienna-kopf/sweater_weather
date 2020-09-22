require 'rails_helper'

RSpec.describe "Background Image Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    it "returns a background image that matches that location", :vcr do
      location = "denver, co"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      response.content_type == "application/json"

      background_image = JSON.parse(response.body, symbolize_names: true)

      expect(background_image).to be_a Hash
      expect(background_image).to have_key :data
      expect(background_image[:data]).to have_key :id
      expect(background_image[:data]).to have_key :type
      expect(background_image[:data][:type]).to eq('backgrounds')
      expect(background_image[:data]).to have_key :attributes

      expect(background_image[:data][:attributes]).to be_a Hash

      expect(background_image[:data][:attributes]).to have_key :id
      expect(background_image[:data][:attributes][:id]).to be_a Integer
      expect(background_image[:data][:attributes]).to have_key :image_url
      expect(background_image[:data][:attributes][:image_url]).to be_a String
      expect(background_image[:data][:attributes]).to have_key :user_name
      expect(background_image[:data][:attributes][:user_name]).to be_a String
      expect(background_image[:data][:attributes]).to have_key :user_url
      expect(background_image[:data][:attributes][:user_url]).to be_a String
      expect(background_image[:data][:attributes]).to have_key :location
      expect(background_image[:data][:attributes][:location]).to be_a String
      expect(background_image[:data][:attributes][:location]).to eq("denver, co")

      expect(background_image[:data][:attributes]).to_not have_key :type
      expect(background_image[:data][:attributes]).to_not have_key :tags
      expect(background_image[:data][:attributes]).to_not have_key :previewURL
      expect(background_image[:data][:attributes]).to_not have_key :previewWidth
      expect(background_image[:data][:attributes]).to_not have_key :previewHeight
      expect(background_image[:data][:attributes]).to_not have_key :webformatWidth
      expect(background_image[:data][:attributes]).to_not have_key :webformatHeight
      expect(background_image[:data][:attributes]).to_not have_key :largeImageURL
      expect(background_image[:data][:attributes]).to_not have_key :imageWidth
      expect(background_image[:data][:attributes]).to_not have_key :imageHeight
      expect(background_image[:data][:attributes]).to_not have_key :imageSize
      expect(background_image[:data][:attributes]).to_not have_key :views
      expect(background_image[:data][:attributes]).to_not have_key :favorites
      expect(background_image[:data][:attributes]).to_not have_key :likes
      expect(background_image[:data][:attributes]).to_not have_key :comments
      expect(background_image[:data][:attributes]).to_not have_key :user_id
    end
  end
end
