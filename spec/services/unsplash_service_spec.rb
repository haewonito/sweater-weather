require "rails_helper"

RSpec.describe "Unsplash API Service" do
    it "can get a picture for a location", :vcr do
      params = {query: "denver co"}
      response = UnsplashService.get_image(params)
      expect(response).to be_a Hash
      expect(response[:results][0][:urls][:raw]).to be_a String
      expect(response[:results][0][:user][:name]).to be_a String
      expect(response[:results][0][:tags][0][:title]).to be_a String
    end
end
