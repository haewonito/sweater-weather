class MapquestFacade
  class << self
    def get_lat(params)
      mapquest_data = MapquestService.get_lonlat(params)
      mapquest_data[:results][0][:locations][0][:latLng][:lat]
    end

    def get_lon(params)
      mapquest_data = MapquestService.get_lonlat(params)
      mapquest_data[:results][0][:locations][0][:latLng][:lng]
    end

  end
end
