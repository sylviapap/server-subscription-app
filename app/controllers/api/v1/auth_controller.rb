class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])
        
        if user && user.authenticate(user_login_params[:password])
          my_token = issue_token(user)
    
          render json: {id: user.id, username: user.username, user: UserSerializer.new(user), token: my_token}, status: :accepted
        else
          render json: {error: 'User could not be logged in'}, status: :unauthorized
        end
    end
    
    def show
        if logged_in?
          render json: { id: current_user.id, username: current_user.username, user: UserSerializer.new(current_user) }, status: :accepted
        else
          render json: {error: 'No user found'}, status: :unauthorized
        end
    end

    private
 
    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end
