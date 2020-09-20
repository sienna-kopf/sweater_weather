require 'rails_helper'

RSpec.describe BackgroundImageFacade do
  describe 'instance methods' do
    before :each do
      location = "denver"
      @facade = BackgroundImageFacade.new(location)
    end
    describe '#response_image' do
      it "calls the Pixabay API to return 5 images for a city keyword" do
        response = @facade.response_image

        expect(response).to be_a Hash
        expect(response).to have_key :hits
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

    describe '#background_image' do
      it "instantiates an image object from a random one of the 5 responses" do
        response = @facade.background_image

        expect(response).to be_an BackgroundImage
        expect(response.id).to be_an Integer
        expect(response.image_url).to be_an String
        expect(response.user_name).to be_an String
        expect(response.user_url).to be_an String
      end
    end
  end
end
