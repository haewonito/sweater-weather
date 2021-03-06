class WeatherService
  class << self
    def get_weather(params = {})
      response = conn.get("/data/2.5/onecall") do |f|
        f.params = params
        f.params[:appid] = ENV["weather_api_key"]
        f.params[:units] = "imperial"
      end

      parse_data(response)
    end

    private
    def conn
      Faraday.new("https://api.openweathermap.org")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
