class SessionsController < ApplicationController
  def create
    # Find the user by email
    user = User.find_by(email: params[:email])

    # Authenticate the user
    if user && user.authenticate(params[:password])
      # Generate a JWT Token
      token = JWT.encode({user_id: user.id}, Rails.application.credentials.secret_key_base)

      # Return the token in the response
      render json: { jwt: token, user: user}, status: :created
    else
      # Invalid code
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
