class UserSerializer < ActiveModel::Serializer
  has_many :user_subscriptions
  attributes :id, :username
end
