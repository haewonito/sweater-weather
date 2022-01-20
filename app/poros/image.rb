class Image
  attr_reader :location, :image_url, :credit

  def initialize(data)
    @location = data[:tags][0][:title]
    @image_url = data[:urls][:raw]
    @credit = { source: "unsplash.com", author: data[:user][:name], profile_link: data[:user][:links][:self], logo: "https://unsplash.com/photos/Y3DZ8QNraAY" }
  end
end
