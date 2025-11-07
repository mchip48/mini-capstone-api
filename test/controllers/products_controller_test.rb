require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "create" do

    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Matthew", price: 4.00, image_url: "matt.jpg", description: "Actualize", inventory: 5}
      assert_response 201
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end
end
