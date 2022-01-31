require 'rails_helper'

RSpec.describe 'create new user', type: :request do
  it 'should return user information, happy path' do
    user =
      {
        "email": "haewon@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }
    post '/api/v1/users', params: user

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json_response).to be_a Hash
    expect(json_response).to have_key :data
    expect(json_response[:data]).to have_key :type
    expect(json_response[:data][:type]).to eq("users")
    expect(json_response[:data]).to have_key :id
    expect(json_response[:data]).to have_key :attributes
    expect(json_response[:data][:attributes]).to have_key :email
    expect(json_response[:data][:attributes]).to have_key :api_key
  end

  it 'should return user information, sad path, password' do
    user =
      {
        "email": "haewon@example.com",
        "password": "password",
        "password_confirmation": "password123"
      }
    post '/api/v1/users', params: user

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to eq({:error=>"Passwords do not match."})
  end

  it 'should return user information, sad path, email' do
    user =
      {
        "email": "haewon@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }
    post '/api/v1/users', params: user

    post '/api/v1/users', params: user

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to eq("error": "A user with the email already exists.")
  end
end
