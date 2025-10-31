class ProductsController < ApplicationController

  def show
    @product = Product.find(params["id"])
    render template: "products/show"
  end

  # def orange_hat
  #   @product = Product.second
  #   render template: "products/show"
  # end

  # def blue_shirt
  #   @product = Product.last
  #   render template: "products/show"
  # end

  # def all_products
  #   @products = Product.all
  #   render template: "products/index"
  # end

end
