class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_url, :user_name, :user_url

  attribute :location do |background, params|
    params[:location]
  end
end
