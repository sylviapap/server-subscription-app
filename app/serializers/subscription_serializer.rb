class SubscriptionSerializer < ActiveModel::Serializer
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions

  attributes :id, :company, :cost
end
