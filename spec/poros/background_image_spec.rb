require 'rails_helper'

describe BackgroundImage do
  it 'exists' do
    attrs = {
            "id": 2617524,
            "pageURL": "https://pixabay.com/photos/larimer-lodo-denver-colorado-2617524/",
            "user": "quinntheislander",
            "userImageURL": "https://cdn.pixabay.com/user/2017/08/02/07-08-01-965_250x250.png"
        }

    image = BackgroundImage.new(attrs)

    expect(image).to be_a BackgroundImage
    expect(image.id).to be_a Integer
    expect(image.id).to eq(2617524)
    expect(image.image_url).to be_a String
    expect(image.image_url).to eq("https://pixabay.com/photos/larimer-lodo-denver-colorado-2617524/")
    expect(image.user_name).to be_a String
    expect(image.user_name).to eq("quinntheislander")
    expect(image.user_url).to be_a String
    expect(image.user_url).to eq("https://cdn.pixabay.com/user/2017/08/02/07-08-01-965_250x250.png")
  end
end
