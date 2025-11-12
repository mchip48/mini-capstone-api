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
    assert_equal Product.first.id, data["id"]
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

  supplier = Supplier.first || Supplier.create!(name: "Test Supplier")
  product = Product.first || Product.create!(name: "Original", price: 10.0, supplier: supplier)

  # Valid update
  patch "/products/#{product.id}.json", params: { 
    name: "Updated Name",
    price: product.price,
    image_url: product.image_url,
    description: product.description,
    inventory: product.inventory,
    supplier_id: supplier.id
  }
  assert_response 200

  data = JSON.parse(response.body)
  assert_equal "Updated Name", data["name"]

  # Invalid update (name empty)
  patch "/products/#{product.id}.json", params: { 
    name: "", 
    price: product.price,
    image_url: product.image_url,
    description: product.description,
    inventory: product.inventory,
    supplier_id: supplier.id
  }
  assert_response 422
end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 204
    end
  end
end
