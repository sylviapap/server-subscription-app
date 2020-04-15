class UserSerializer < ActiveModel::Serializer
  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions
  attributes :id, :username
end
