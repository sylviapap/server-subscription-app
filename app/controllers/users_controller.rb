class UsersController < ApplicationController
    def index
    end

    def show
        user = User.find(params[:id])
    end

    def new

    end

    def create
        user = User.find_or_create_by(name: user_params[:name])
        if user
            render json: user
        else
            render json: {message: "Couldn't create user"}
        end
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
