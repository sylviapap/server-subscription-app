class CreateUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subscriptions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
