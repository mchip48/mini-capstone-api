class ProductsController < ApplicationController

  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params["id"])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: "Test Post Name",
      price: 10,
      image_url: "test-post-image.jpeg",
      description: "Test Description"
    )
    render template: "products/show"
  end

end
