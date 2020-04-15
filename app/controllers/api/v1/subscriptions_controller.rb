class Api::V1::SubscriptionsController < ApplicationController
    def new
    end

    def index
        subscriptions = Subscription.all
        render json: subscriptions
    end

    def create
        subscription = Subscription.create(subscription_params)
        render json: subscription
    end

    def show
        subscription = Subscription.find(params[:id])
        render json: subscription
    end

    def destroy
    end

    private

    def subscription_params
        params.require(:subscription).permit(:company, :cost)
    end
end
