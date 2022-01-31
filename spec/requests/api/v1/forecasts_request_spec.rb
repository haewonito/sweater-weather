require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'GET /api/v1/forecast?' do
   it "returns weather information with given location" do

     get '/api/v1/forecast?location=denver co'

     expect(response).to have_http_status(200)

     forecast = JSON.parse(response.body, symbolize_names: true)
     expect(forecast).to_not be_empty
     expect(forecast[:id]).to eq(nil)

     expect(forecast[:data][:attributes]).to have_key(:current_weather)
     expect(forecast[:data][:attributes]).to have_key(:daily_weathers)
     expect(forecast[:data][:attributes]).to have_key(:hourly_weathers)

     expect(forecast[:data][:attributes][:daily_weathers].count).to eq(5)
     expect(forecast[:data][:attributes][:hourly_weathers].count).to eq(8)

     expect(forecast[:data][:attributes][:current_weather]).to be_a Hash
     expect(forecast[:data][:attributes][:daily_weathers]).to be_a Array
     expect(forecast[:data][:attributes][:hourly_weathers]).to be_a Array
   end

   it "does not send unnecessary information" do
     get '/api/v1/forecast?location=denver co'
     forecast = JSON.parse(response.body, symbolize_names: true)

     expect(forecast[:data][:attributes]).to_not have_key(:lon)
     expect(forecast[:data][:attributes]).to_not have_key(:lat)
   end
  end
end
