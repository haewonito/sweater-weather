class MapquestService
  class << self
    def get_lonlat(params = {})
      response = conn.get("/geocoding/v1/address?") do |f|
        f.params = params
        f.params[:key] = ENV["mapquest_api_key"]
      end
      parse_data(response)
    end

    def get_direction(params = {})
      response = conn.get("/directions/v2/route") do |f|
        f.params = params
        f.params[:key] = ENV["mapquest_api_key"]
      end
      parse_data(response)
    end

    private
    def conn
      Faraday.new("http://www.mapquestapi.com")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
