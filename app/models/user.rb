class User < ApplicationRecord
    has_secure_password
    has_many :user_subscriptions, dependent: :destroy
    validates :username, uniqueness: { case_sensitive: false }
end
