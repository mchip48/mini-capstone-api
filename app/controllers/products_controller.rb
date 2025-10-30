class ProductsController < ApplicationController

  def red_sweatshirt
    @product = Product.first
    render template: "products/show"
  end

  def orange_hat
    @product = Product.second
    render template: "products/show"
  end

  def blue_shirt
    @product = Product.last
    render template: "products/show"
  end

  def all_products
    @products = Product.all
    render template: "products/index"
  end

end
