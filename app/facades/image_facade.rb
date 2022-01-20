class ImageFacade
  class << self
    def get_image(params)
      image_data = UnsplashService.get_image(params)
      Image.new(image_data[:results][0])
    end
  end
end
