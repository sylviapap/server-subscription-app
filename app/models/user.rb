class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, presence: true

    has_many :user_subscriptions, dependent: :destroy
    has_many :subscriptions, through: :user_subscriptions, dependent: :destroy

    accepts_nested_attributes_for :user_subscriptions
end
