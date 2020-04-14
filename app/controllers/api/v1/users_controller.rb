class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:update]
    
    def index
      @users = User.all
      render json: @users
    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
      @user = User.find_or_create_by(username: user_params[:username])
    end

    def edit
    end
  
    def update
      @user.update(user_params)
      if @user.save
        render json: @user, status: :accepted
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
    end
  
    private
  
    def user_params
        params.require(:user).permit(:username, :password)
    end
  
    def find_user
      @user = User.find(params[:id])
    end
end