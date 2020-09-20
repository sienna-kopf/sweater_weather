class BackgroundImage
  attr_reader :id,
              :image_url,
              :user_name,
              :user_url

  def initialize(image_info)
    @id = image_info[:id]
    @image_url = image_info[:pageURL]
    @user_name = image_info[:user]
    @user_url = image_info[:userImageURL]
  end
end
