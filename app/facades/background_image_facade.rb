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
    BackgroundImage.new(response_image[:hits][sample_index])
  end

  def sample_index
    (0..4).to_a.sample
  end
end
