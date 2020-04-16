class Api::V1::UserSubscriptionsController < ApplicationController
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
        
        user_subscription = UserSubscription.new(user_subscription_params)
        if user_subscription.save
            render json: user_subscription
        else
            render json: {message: "UserSubscription error"}
        end
    end

    def edit
    end

    def update
        user_subscription = UserSubscription.update(user_subscription_params)
        if user_subscription.save
          render json: user_subscription, status: :accepted
        else
          render json: { errors: user_subscription.errors.full_messages }, status: :unprocessible_entity
        end
      end

    def destroy
        user_subscription = UserSubscription.find(params[:id])
        user_subscription.destroy
    end

    private

    def user_subscription_params
        params.require(:user_subscription).permit(:user_id, :subscription_id, :start_date)
    end
end
