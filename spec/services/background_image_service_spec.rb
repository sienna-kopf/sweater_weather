require 'rails_helper'

RSpec.describe BackgroundImageService do
  context 'instance methods' do
    context '#image' do
      it "takes in a city and returns an image of that location", :vcr do
        city = "denver"
        service = BackgroundImageService.new
        response = service.image(city)
        expect(response).to be_a Hash
        expect(response[:hits]).to be_an Array
        expect(response[:hits].size).to eq(5)
        target_image = response[:hits][0]
        expect(target_image).to be_a Hash
        expect(target_image).to have_key :id
        expect(target_image[:id]).to be_a Integer
        expect(target_image).to have_key :pageURL
        expect(target_image[:pageURL]).to be_a String
        expect(target_image).to have_key :user
        expect(target_image[:user]).to be_a String
        expect(target_image).to have_key :userImageURL
        expect(target_image[:userImageURL]).to be_a String
      end
    end
  end
end
