class Api::V1::BackgroundsController < ApplicationController
  def show
    city = params[:location].split(',')[0]
    image = BackgroundImageFacade.new(city).background_image
    render json: BackgroundsSerializer.new(image, {params: {location: params[:location]}})
  end
end
