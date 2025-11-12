class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    render json: @products
  end

  def create
    
  end
end
