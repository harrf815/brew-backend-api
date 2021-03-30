class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

  # Login
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # issue that user a token\
      token = issue_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: token}, status: :accepted
    else
      render json: {error: 'That user could not be found'}, status: :unauthorized
    end
  end
end
  