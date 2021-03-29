class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

  # Login
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # issue that user a token\
      token = issue_token(user)
      render json: {id: user.id, username: user.username, jwt: token}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

  def show
    user = User.find_by(id: user_id)
    if user && logged_in?
      render json: { id: user.id, username: user.username }
    else
      render json: {error: 'No user could be found, please create an account'}, status: 401
    end
  end
end
  