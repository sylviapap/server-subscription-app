class Subscription < ApplicationRecord
    has_many :user_subscriptions, dependent: :destroy
    has_many :users, through: :user_subscriptions
end
