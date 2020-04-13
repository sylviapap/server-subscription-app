class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :company
      t.float :cost

      t.timestamps
    end
  end
end
