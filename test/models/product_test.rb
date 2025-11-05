require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "is_discounted?" do
    product = Product.new(price: 50)
    assert_equal false, product.is_discounted?
  end

  test "tax" do
    product = Product.new(price: 100)
    assert_equal 9.00, product.tax
  end

  test "total" do
    product = Product.new(price: 100)
    assert_equal 109.00, product.total
  end
end
