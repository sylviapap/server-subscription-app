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
      @user = User.create(user_params)
      if @user.valid?
        render json: @user, status: :accepted
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
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
      user = User.find(params[:id])
      user.destroy
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
  
    def find_user
      @user = User.find(params[:id])
    end
end
