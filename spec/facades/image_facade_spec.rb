require "rails_helper"

RSpec.describe ImageFacade do
  it "constructs image object", :vcr do
    params = {query: "denver co"}
    image = ImageFacade.get_image(params)
    expect(image.credit).to eq({:author=>"Jakob Rosen", :logo=>"https://unsplash.com/photos/Y3DZ8QNraAY", :profile_link=>"https://api.unsplash.com/users/jakobnoahrosen", :source=>"unsplash.com"})
    expect(image.image_url).to eq("https://images.unsplash.com/photo-1616452862870-b43181d0be29?ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MzI3NzE&ixlib=rb-1.2.1")
    expect(image.location).to eq("denver")
  end
end
