require "rails_helper"

RSpec.describe WeatherFacade do
  it "constructs weather objects", :vcr do
    params = {location: "denver co"}
    weather = WeatherFacade.get_weather(params)

    # expect(fos.count).to eq(10)
    # expect(fos.first).to be_a Fo
    # expect(fos.first.description).to eq("")
  end
end
