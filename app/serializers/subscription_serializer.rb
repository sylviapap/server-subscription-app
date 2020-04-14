class SubscriptionSerializer < ActiveModel::Serializer
  has_many :user_subscriptions
  attributes :id, :company, :cost
end
