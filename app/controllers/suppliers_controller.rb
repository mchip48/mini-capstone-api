class SuppliersController < ApplicationController
  
  def index
    @suppliers = Supplier.all
    render template: "suppliers/index"
  end

  def show
    @supplier = Supplier.find(params[:id])
    render template: "suppliers/show"
  end

  def create
    @supplier = Supplier.new(
      name: params[:name]
    )

    if @supplier.save
      render :show, status: :created
    else
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end
end
