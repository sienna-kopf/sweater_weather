class BackgroundImageService
  def image(location)
    to_json("?q=#{location}&image_type=photo&per_page=5&safesearch=true")
  end

  private

  def conn
    Faraday.new('https://pixabay.com/api/') do |f|
      f.params[:key] = "#{ENV['PIXABAY_API_KEY']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
