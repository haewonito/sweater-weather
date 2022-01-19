class Forecast
  attr_reader :current_weather, :daily_weathers, :hourly_weathers

  def initialize(current_weather_poro, daily_weather_poros, hourly_weather_poros)
    @current_weather = current_weather_poro
    @daily_weathers = daily_weather_poros #these two are ARRAYS of poros. don't forget
    @hourly_weathers = hourly_weather_poros
  end
end
