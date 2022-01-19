class Api::V1::ForecastController < ApplicationController
  def index
    forecast = WeatherFacade.get_forecast(params)
    render json: ForecastSerializer.new(forecast)
  end
end
