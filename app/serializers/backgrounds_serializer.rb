class BackgroundsSerializer
  def initialize(image, location)
    @image = image
    @location = location
  end

  def data_hash
    {
      data:
      {
        type: 'image',
        location: @location,
        image: {
          attributes: @image.as_json
        }
      }
    }
  end
end
