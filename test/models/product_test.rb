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

  test "friendly_created_at" do
    product = Product.new(created_at: "2025-10-30 02:37:14.567340000 +0000")
    assert_equal "Oct 30,  2:37 AM", product.friendly_created_at
  end

  
end
