require "rails_helper"

RSpec.describe DailyWeather do
  it "has attributes" do
    daily_weather = DailyWeather.new(daily_weather_data_for_test)
    expect(daily_weather).to be_a DailyWeather
    expect(daily_weather.datetime).to eq( "2022/01/18, 12:00, -07:00")
    expect(daily_weather.sunrise).to eq("2022/01/18,  7:17, -07:00")
    expect(daily_weather.sunset).to eq("2022/01/18, 17:02, -07:00")
    expect(daily_weather.max_temp).to eq(49.96)
    expect(daily_weather.min_temp).to eq(36.34)
    expect(daily_weather.conditions).to eq("overcast clouds")
    expect(daily_weather.icon).to eq("04d")
  end
end
