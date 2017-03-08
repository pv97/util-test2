class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.integer :utility_id, null:false
      t.float :time_of_use, null:false, array: true, default:[]
      t.float :tiers, null:false, array: true, default:[]
      t.timestamps null:false
    end
  end
end
