class RoadtripFacade
  class << self
    def get_info(params) #the params have from and to
      mapquest_data = MapquestService.get_direction(params)

      if mapquest_data[:info][:statuscode] == 402
        return 402
      else
        start_city = mapquest_data[:route][:locations][0][:adminArea5] + ", " + mapquest_data[:route][:locations][0][:adminArea3]
        end_city = mapquest_data[:route][:locations][1][:adminArea5] + ", " + mapquest_data[:route][:locations][1][:adminArea3]

        seconds = mapquest_data[:route][:legs][0][:time]
        hours = seconds/3600
        minutes = (seconds - (hours*3600))/60
        travel_time = hours.to_s + " hours, " + minutes.to_s + " minutes"
        eta_hour = (seconds.to_f/3600).round

        params[:location] = end_city
        params[:lat] = MapquestFacade.get_lat(params)
        params[:lon] = MapquestFacade.get_lon(params)

        weather_data = WeatherService.get_weather(params)
        weather_at_eta = weather_data[:hourly][eta_hour]

        temperature_at_eta = weather_at_eta[:temp]
        condition_at_eta = weather_at_eta[:weather][0][:description]
        Roadtrip.new(start_city, end_city, travel_time, temperature_at_eta, condition_at_eta)
      end
    end
  end
end
