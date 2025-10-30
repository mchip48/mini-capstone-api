# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

product_1 = Product.create(
  name: "Red Sweatshirt",
  price: 50,
  image_url: "https://media.istockphoto.com/id/154960461/photo/red-sweat-shirt-on-white-background.jpg?s=612x612&w=0&k=20&,c=qpFaTOu5Bse6HFEFzl0gYpNfTKU-akpmNlDMsIxu1sU=",
  description: "Very fluffy red sweatshirt for fall!"
)

product_2 = Product.create(
  name: "Orange Hat",
  price: 35,
  image_url: "https://media.istockphoto.com/id/498113633/photo/cap-orange.jpg?s=612x612&w=0&k=20&c=ddjyXSdvPbrj4OTw_1gIPmdE4q1eVx0bOz3WrkiYKOQ=",
  description: "Bright orange hat so that you won't be missed in a crowd!"
)

product_3 = Product.create(
  name: "Light Blue T-Shirt",
  price: 25,
  image_url: "https://media.istockphoto.com/id/471951938/photo/blue-t-shirt-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=pyxmdKWcO5rlVGIb7f2YCAlRC_imespbWs0ixWjOo4A=",
  description: "Light blue tee perfect for summer!"
)

puts "Successfully added first 3 products to seeds."