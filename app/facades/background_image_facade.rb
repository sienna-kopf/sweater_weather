class BackgroundImageFacade
  attr_reader :location

  def initialize(location)
    @location = location
    @service = BackgroundImageService.new
  end

  def response_image
    @service.image(@location)
  end

  def background_image
    image_number = (0..4).to_a.sample
    image_info = response_image[:hits][image_number]

    BackgroundImage.new(image_info)
  end
end
