class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
  

    def getuser
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
     end

    
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = issue_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), token: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
    
    # def create
    #   # byebug
    #   user = User.new(user_params)
    #   if user.save
    #     token = encode_token({user_id: user.id})
    #     render json: {user: user, token: token}
    #   else
    #     render json: user.errors
    #   end
    # end 
  
    # def login
    #   user = User.find_by(username: params[:username])
    #   if user && user.authenticate(params[:password])
    #     token = issue_token({user_id: user.id})
    #     render json: {user: UserSerializer.new(user), token: token}
    #   else
    #     render json: {error: "Incorrect Username or Password"}
    #   end
    # end 
    

    private
  
    def user_params
      params.permit(:username, :password)
    end
end 

