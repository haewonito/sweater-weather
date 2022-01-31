require "rails_helper"

RSpec.describe "Mapquest API Service" do
  it "can get longitutde and latitude", :vcr do
    params = {location: "denver co"}
    response = MapquestService.get_lonlat(params)

    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float
  end

  it "happy path: it can get driving directions", :vcr do
    params = {to: "New York, NY", from: "Los Angeles, CA"}
    response = MapquestService.get_direction(params)
#from location
    expect(response[:route][:locations][0][:adminArea5]).to be_a String
    expect(response[:route][:locations][0][:adminArea3]).to be_a String
#to location
    expect(response[:route][:locations][1][:adminArea5]).to be_a String
    expect(response[:route][:locations][1][:adminArea3]).to be_a String
#travel time in seconds
    expect(response[:route][:legs][0][:time]).to be_a Integer
  end

  it "sad path: it returns 402 if driving direction not available", :vcr do
    params = {to: "New York, NY", from: "London, UK"}
    response = MapquestService.get_direction(params)
    expect(response[:info][:statuscode]).to eq(402)
  end
end
