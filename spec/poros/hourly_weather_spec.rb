require "rails_helper"

RSpec.describe HourlyWeather do
  it "has attributes" do
    hourly_weather = HourlyWeather.new(hourly_weather_data_for_test)
    expect(hourly_weather).to be_a HourlyWeather
    expect(hourly_weather.datetime).to eq("2022/01/18,  8:00, -07:00")
    expect(hourly_weather.temperature).to eq(39.99)
    expect(hourly_weather.conditions).to eq("overcast clouds")
    expect(hourly_weather.icon).to eq("04d")
  end
end
