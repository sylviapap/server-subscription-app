# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserSubscription.delete_all
User.delete_all
Subscription.delete_all

user = User.create(username: 'user1', password: 'pw')

subscription1 = Subscription.create(company: 'Netflix', cost: 8.99)
Subscription.create(company: 'Hulu', cost: 5.99)
Subscription.create(company: 'Amazon', cost: 12.99)
Subscription.create(company: 'InstaCart', cost: 9.99)

user_subscription = UserSubscription.create(user_id: user.id, subscription_id: subscription1.id)