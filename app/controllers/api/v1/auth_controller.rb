class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])
        
        if user && user.authenticate(user_login_params[:password])
            my_token = issue_token(user))
            render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
          else
            render json: { message: 'Invalid username or password' }, status: 401
          end
        end
    
    def show
        if logged_in?
            render json: { id: current_user.id, username: current_user.username }
        else
            render json: {error: 'No user could be found'}, status: 401
        end
    end

    private
 
    def user_login_params
      params.require(:user).permit(:username, :password)
    end
end
