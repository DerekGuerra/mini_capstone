class Image < ApplicationRecord

  @products = Product.all

  @products.each do |product|
    Image.url = product.image_url
  end
end
