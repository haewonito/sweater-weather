class WeatherFacade
  class << self
    def get_weather(params)
      params[:lat] = MapquestFacade.get_lat(params)
      params[:lon] = MapquestFacade.get_lon(params)
      weather_data = WeatherService.get_weather(params)
    end

    def  get_current(params)
      data = get_weather(params)
      current_data = data[:current]
      CurrentWeather.new(current_data)
    end

    def get_daily(params)
      data1 = get_weather(params)
      data2 = data1[:daily][0..4]
      data2.map do |daily_data|
        DailyWeather.new(daily_data)
      end
    end

    def get_hourly(params)
      data = get_weather(params)
      hourly_data = data[:hourly][0..7]
      hourly_data.map do |hourly|
        HourlyWeather.new(hourly_data)
      end
    end

    def get_forecast(params)  #?????
      Forecase.new(get_current(params), get_daily(params), get_hourly(params))
    end
  end
end
