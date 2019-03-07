json.array! @products.each do |product|
  json.id product.id
  json.name product.name 
  json.price product.price
  json.clearance? product.is_discounted?
  json.tax product.tax
  json.total_price product.sum
  json.description product.description
  json.image_url product.image_url
end   