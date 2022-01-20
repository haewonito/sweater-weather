class Api::V1::ImageController < ApplicationController
  def index
    params[:query] = params[:location]
    image = ImageFacade.get_image(params)
    render json: ImageSerializer.unsplash_image(image)
  end
end
