class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    city = location.split(',')[0]
    image = BackgroundImageFacade.new(city).background_image
    render json: BackgroundsSerializer.new(image, location).data_hash
  end
end
