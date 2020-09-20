class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location].split(',')[0]

    image_facade = ImageFacade.new(location)

    render json: BackgroundsSerializer.new(image_facade).data_hash
  end
end
