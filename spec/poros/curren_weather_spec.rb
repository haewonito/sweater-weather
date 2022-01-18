require "rails_helper"

RSpec.describe CurrentWeather do
  it "has attributes" do
    current_weather = CurrentWeather.new(current_weather_data_for_test)
    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.datetime).to eq("2022/01/18,  8:50, -07:00")
    expect(current_weather.sunrise).to eq(1642515466)
    expect(current_weather.sunset).to eq(1642550558)
    expect(current_weather.temperature).to eq(40.3)
    expect(current_weather.feels_like).to eq(40.3)
    expect(current_weather.humidity).to eq(44)
    expect(current_weather.uvi).to eq(0.42)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
