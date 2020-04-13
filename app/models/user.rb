class User < ApplicationRecord
    has_many :user_subscriptions, dependent: :destroy
end
