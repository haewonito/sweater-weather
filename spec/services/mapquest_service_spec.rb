require "rails_helper"

RSpec.describe "Mapquest API Service" do
  it "can get longitutde and latitude", :vcr do
    params = {location: "denver co"}
    response = MapquestService.get_lonlat(params)

    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float
  end
end
