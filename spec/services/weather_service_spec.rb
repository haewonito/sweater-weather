require "rails_helper"

RSpec.describe "Openweather API Service" do
    it "can get weather information", :vcr do
      params = {lat: "39.738453", lon:"-104.984853"}
      response = WeatherService.get_weather(params)
      expect(response[:current]).to be_a Hash
      expect(response[:daily]).to be_an Array
      expect(response[:hourly]).to be_an Array
    end
end
