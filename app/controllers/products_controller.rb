class ProductsController < ApplicationController
   before_action :authorize_request

  def index
    products = Product.all

    render json: products
  end

  def create
   product = Product.new(
    name: params[:name],
    price: params[:price],
    user_id: params[:user_id]
   ) 

   if product.save
      render json: { message: "Product created successfully" }, status: :created
   else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end
end