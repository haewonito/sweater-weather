class DailyWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @datetime = Time.at(data[:dt]).to_datetime.strftime("%Y/%m/%d, %k:%M, %:z")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%Y/%m/%d, %k:%M, %:z")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%Y/%m/%d, %k:%M, %:z")
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon= data[:weather][0][:icon]
  end
end
