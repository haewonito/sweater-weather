class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id

  def initialize(start_city, end_city, travel_time, temperature_at_eta, condition_at_eta)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    @weather_at_eta = {temperature: temperature_at_eta, conditions: condition_at_eta}
  end
end
