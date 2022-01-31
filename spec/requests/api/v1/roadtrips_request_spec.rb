require 'rails_helper'

RSpec.describe 'roadtrip' do
  it 'should return roadtrip data, happy path', :vcr do
    body =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/roadtrips', params: body

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data][:type]).to eq("roadtrips")
    expect(roadtrip[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(roadtrip[:data][:attributes][:end_city]).to eq("Pueblo, CO")
    expect(roadtrip[:data][:attributes][:travel_time]).to eq("1 hours, 45 minutes")
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end
end
