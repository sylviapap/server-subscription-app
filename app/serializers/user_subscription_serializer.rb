class UserSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :subscription_id, :start_date, :end_date, :next_payment
end
