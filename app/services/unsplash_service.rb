class UnsplashService
  class << self
    def get_image(params = {})
      response = conn.get("search/photos") do |f|
        f.params = params
        f.params[:client_id] = ENV["upsplash_api_key"]
        f.params[:per_page] = 1
      end

      parse_data(response)
    end

    private
    def conn
      Faraday.new("https://api.unsplash.com")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
