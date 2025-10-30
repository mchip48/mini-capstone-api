class ProductsController < ApplicationController

  def red_sweatshirt
    @product = Product.first
    render json: @product
  end

  def orange_hat
    @product = Product.second
    render json: @product
  end

  def blue_shirt
    @product = Product.last
    render json: @product
  end

  def all_products
    @products = Product.all
    render template: "products/index"
  end

end
