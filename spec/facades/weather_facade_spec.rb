require "rails_helper"

RSpec.describe WeatherFacade do
  before(:each) do
    @params = {location: "denver co"}
  end
  it "#get_current", :vcr do
    current_weather = WeatherFacade.get_current(@params)
    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.datetime).to eq("2022/01/18, 11:01, -07:00")
    expect(current_weather.sunrise).to eq("2022/01/18,  7:17, -07:00",)
    expect(current_weather.sunset).to eq("2022/01/18, 17:02, -07:00")
    expect(current_weather.temperature).to eq(45.9)
    expect(current_weather.feels_like).to eq(45.9)
    expect(current_weather.humidity).to eq(35)
    expect(current_weather.uvi).to eq(1.21)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end

  it "#get_daily", :vcr do
    daily_weathers = WeatherFacade.get_daily(@params)
    daily_weather = daily_weathers[0]
    expect(daily_weathers.count).to eq(5)
    expect(daily_weather).to be_a DailyWeather
    expect(daily_weather.datetime).to eq("2022/01/18, 12:00, -07:00")
    expect(daily_weather.sunrise).to eq("2022/01/18,  7:17, -07:00")
    expect(daily_weather.sunset).to eq("2022/01/18, 17:02, -07:00")
    expect(daily_weather.max_temp).to eq(48.6)
    expect(daily_weather.min_temp).to eq(36.34)
    expect(daily_weather.conditions).to eq("overcast clouds")
    expect(daily_weather.icon).to eq("04d")
  end

  it "#get_hourly", :vcr do
    hourly_weathers = WeatherFacade.get_hourly(@params)
    hourly_weather = hourly_weathers[0]
    expect(hourly_weather).to be_a HourlyWeather
    expect(hourly_weather.datetime).to eq("2022/01/18, 11:00, -07:00")
    expect(hourly_weather.temperature).to eq(45.9)
    expect(hourly_weather.conditions).to eq("overcast clouds")
    expect(hourly_weather.icon).to eq("04d")
  end

  it "#get_forcast", :vcr do
    forecast = WeatherFacade.get_forecast(@params)
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weathers.count).to eq(5)
    expect(forecast.daily_weathers[0]).to be_a DailyWeather
    expect(forecast.hourly_weathers.count).to eq(8)
    expect(forecast.hourly_weathers[0]).to be_a HourlyWeather
  end
end
