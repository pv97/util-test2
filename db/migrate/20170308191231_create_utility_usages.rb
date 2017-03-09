class CreateUtilityUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :utility_usages do |t|
      t.integer :subscription_id, null:false
      t.float :kWh_used, null:false
      t.timestamp :start_time, null:false
      t.timestamp :end_time, null:false

      t.timestamps null:false
    end
    add_index :utility_usages, :subscription_id
  end
end
