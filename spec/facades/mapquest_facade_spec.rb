require "rails_helper"

RSpec.describe MapquestFacade do
  it "returns latitude", :vcr do
    params = {location: "denver co"}
    latitude = MapquestFacade.get_lat(params)
    expect(latitude).to eq(39.738453)
  end

  it "returns longitude", :vcr do
    params = {location: "denver co"}
    longitude = MapquestFacade.get_lon(params)
    expect(longitude).to eq(-104.984853)
  end
end
