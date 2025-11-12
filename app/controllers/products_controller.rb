class ProductsController < ApplicationController
  # GET /products.json
  def index
    products = Product.all
    render json: products
  end

  # GET /products/:id.json
  def show
    product = Product.find(params[:id])
    render json: product
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Product not found" }, status: :not_found
  end

  # POST /products.json
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id.json
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id.json
  def destroy
    product = Product.find(params[:id])
    product.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Product not found" }, status: :not_found
  end

  private

  def product_params
    params.permit(:name, :price, :image_url, :description, :inventory, :supplier_id)
  end
end

  
private  # <- everything below this is private
  def product_params
    params.permit(:name, :price, :image_url, :description, :inventory, :supplier_id)
  end

  
  
  
  
  
  
  
  
  
  
  
  
#   def index
#     @products = Product.all
#     render template: "products/index"
#   end

#   def show
#     @product = Product.find(params[:id])
#     render template: "products/show"
#   end

#   def create
#     @product = Product.new(
#       name: params[:name],
#       price: params[:price],
#       image_url: params[:image_url],
#       description: params[:description],
#       inventory: params[:inventory],
#       supplier_id: params[:supplier_id]
#     )
#     #   render template: "products/show"
#     #  end
#     if @product.save
#       render :show, status: :created
#     else
#       render json: { errors: @product.errors }, status: :unprocessable_entity
#     end

#   end

#   def update
#     @product = Product.find(params[:id])
#     @product.update(
#       name: params[:name] || @product.name,
#       price: params[:price] || @product.price,
#       image_url: params[:image_url] || @product.image_url,
#       description: params[:description] || @product.description,
#       supplier_id: params[:supplier_id] || @product.supplier_id
#     )

#     if @product.valid?
#       render :show, status: :ok
#     else
#       render json: { errors: @product.errors }, status: :unprocessable_entity
#     # render template: "products/show"
#     end
#   end

#   def destroy
#     @product = Product.find(params[:id])
#     @product.destroy
#     head :no_content
#     # render json: { message: "Product was deleted!" }
#   end

# end
