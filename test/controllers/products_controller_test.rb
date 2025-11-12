require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.count
  end
  
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "taxes", "total_price", "is_discounted", "image", "information", "inventory_count", "date_created", "date_updated", "supplier_id", "supplier"], data.keys
  end

  test "create" do

    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Matthew", price: 4.00, image_url: "matt.jpg", description: "Actualize", inventory: 5, supplier_id: Supplier.first.id}
      assert_response 201
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "update" do

    product = Product.first
    patch "/products/#{product.id}.json", params: { name: Product.first.name }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.first.name, data["name"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.name}.json"
      assert_response 200
    end
  end
end
