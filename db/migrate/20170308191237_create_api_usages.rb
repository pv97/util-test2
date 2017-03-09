class CreateApiUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :api_usages do |t|
      t.integer :user_id, null:false
      t.float :cost, null:false

      t.timestamps null:false
    end
    add_index :api_usages, :user_id
  end
end
