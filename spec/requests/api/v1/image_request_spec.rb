require 'rails_helper'

RSpec.describe 'Image API' do
  describe 'GET /api/v1/image?' do
    it "happy path: returns information about an image related with given location", :vcr do

     get '/api/v1/image?location=denver,co'

     expect(response).to have_http_status(200)
     image = JSON.parse(response.body, symbolize_names: true)

      expect(image[:data][:type]).to eq("image")
      expect(image[:data][:attributes][:image][:location]).to eq("denver")
      expect(image[:data][:attributes][:image][:image_url]).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDM0OTUyNzM&ixlib=rb-1.2.1")
      expect(image[:data][:attributes][:image][:credit][:author]).to eq("Dillon Wanner")
      expect(image[:data][:attributes][:image][:credit][:logo]).to eq("https://unsplash.com/photos/Y3DZ8QNraAY")
    end

    # it "sad path: no search result for the supplied query" do
    #
    #   get '/api/v1/image?location=897644'
    #
    #   expect(response).to have_http_status(404)
    #   response_parsed = JSON.parse(response.body, symbolize_names: true)
    #   expect(response_parsed[:errors][:details]).to eq("No Search Result")
    # end
  end
end
