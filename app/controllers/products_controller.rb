class ProductsController < ApplicationController

  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    )
    #   render template: "products/show"
    #  end
    if @product.save
      render :show, status: :created
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end

  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
      supplier_id: params[:supplier_id] || @product.supplier_id
    )
    render template: "products/show"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    render json: { message: "Product was deleted!" }
  end

end
