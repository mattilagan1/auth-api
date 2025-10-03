class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: { message: "User created successfully" }, status: :created
    else

      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      #render json: user.errors, status: :unprocessable_entity
    end
  end
end
