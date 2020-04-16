class UserSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :subscription_id, :start_date, :end_date, :next_payment, :subscription

  belongs_to :subscription
  belongs_to :user
end
