class CreateUtilities < ActiveRecord::Migration[5.0]
  def change
    create_table :utilities do |t|
      t.string :company_name, null:false
      t.timestamps null:false
    end
  end
end
