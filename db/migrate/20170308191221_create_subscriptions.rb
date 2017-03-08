class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null:false
      t.integer :utility_id, null:false
      t.timestamps null:false
    end
  end
end
