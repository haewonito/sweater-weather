require "rails_helper"

RSpec.describe RoadtripFacade do
  it "#get_direction", :vcr do
    params = {to: "New York, NY", from: "Los Angeles, CA"}
    roadtrip = RoadtripFacade.get_info(params)
    expect(roadtrip.end_city).to eq("New York, NY")
    expect(roadtrip.start_city).to eq("Los Angeles, CA")
    expect(roadtrip.travel_time).to eq("40 hours, 21 minutes")
    expect(roadtrip.weather_at_eta[:temperature]).to eq(27.27)
    expect(roadtrip.weather_at_eta[:conditions]).to eq("broken clouds")
  end

  it "returns 402 if driving direction not available", :vcr do
    params = {to: "London, UK", from: "Los Angeles, CA"}
    roadtrip = RoadtripFacade.get_info(params)

    expect(roadtrip).to eq(402)
  end
end
