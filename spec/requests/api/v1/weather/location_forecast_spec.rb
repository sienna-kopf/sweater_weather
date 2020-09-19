require 'rails_helper'

RSpec.describe "Forecast Endpoint", type: :request do
  describe "takes in a location in the form city, state code" do
    describe "converts the location into lat and long" do
      it "returns weather for that location current, hourly, and daily" do
        location = "denver, co"

        get "/api/v1/forecast?location=#{location}"

        expect(response).to be_successful

        # weather = JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
