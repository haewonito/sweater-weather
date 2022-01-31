class ImageSerializer
  # include JSONAPI::Serializer
  #
  # set_type "image"
  # set_id {id: nil}
  # attributes :image... nest location, url and credit inside the image
  def self.unsplash_image(image)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "location": image.location,
            "image_url": image.image_url,
            "credit": {
              "source": image.credit[:source],
              "author": image.credit[:author],
              "logo": image.credit[:logo],
              "profile_link": image.credit[:profile_link]
            }
          }
        }
      }
    }
  end
end
