class ProductsController < ApplicationController

  def show
    @product = Product.find(params["id"])
    render template: "products/show"
  end

  def index
    @products = Product.all
    render template: "products/index"
  end

end
