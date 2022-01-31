class Api::V1::RoadtripsController < ApplicationController
  def create
    params[:to] = params[:destination]
    params[:from] = params[:origin]
    roadtrip = RoadtripFacade.get_info(params)

    if roadtrip == 402
      render json: { error: "Driving direction not available" }, status: 400
    else
      render json: RoadtripsSerializer.new(roadtrip), status: 201
    end
  end
end
