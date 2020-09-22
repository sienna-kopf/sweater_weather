class Api::V1::BackgroundsController < ApplicationController
  def show
    city = params[:location].split(',')[0]
    render json: BackgroundsSerializer.new(BackgroundImageFacade.new(city).background_image, {params: {location: params[:location]}})
  end
end
