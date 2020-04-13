class UserSubscriptionsController < ApplicationController
    def index
        user_subscriptions = UserSubscription.all
        render json: user_subscriptions
    end

    def show
    end

    def new
    end

    def create
        user = User.find(params[:user_id])
        subscription = Subscription.find(params[:subscription_id])
        start_date = (params[:start_date])
        end_date = (params[:end_date])
        
        user_subscription = UserSubscription.new(user_subscription_params)
        if user_subscription.save
            render json: user_subscription
        else
            render json: {message: "UserSubscription error"}
        end

    end

    private

    def user_subscription_params
        params.require(:user_subscription).permit(:user_id, :subscription_id, :start_date, :end_date)
    end
end
