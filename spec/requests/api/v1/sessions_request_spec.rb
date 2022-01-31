require 'rails_helper'

RSpec.describe 'create sessions' do
  it 'can create a session, happy path' do

    new_user_data = {
        "email": "john@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

    user = User.create!(new_user_data)

    user_input =
        {
          "email": "john@example.com",
          "password": "password123"
        }

    post '/api/v1/sessions', params: user_input

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json_response).to be_a Hash
    expect(json_response).to have_key :data
    expect(json_response[:data]).to have_key :id
    expect(json_response[:data]).to have_key :type
    expect(json_response[:data][:type]).to eq("users")
    expect(json_response[:data]).to have_key :attributes
    expect(json_response[:data][:attributes]).to have_key :email
    expect(json_response[:data][:attributes]).to have_key :api_key
  end

  it 'can create a session, sad path' do
    user = User.create!(
        "email": "john@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      )

    user_input =
        {
          "email": "john@example.com",
          "password": "password"
        }
    post '/api/v1/sessions', params: user_input

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response).to eq({error: 'Input is incorrect'})
  end
end
