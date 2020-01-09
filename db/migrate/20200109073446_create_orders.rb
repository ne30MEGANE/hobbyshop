class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :time, null:false
      t.integer :pay, null: false
      t.boolean :delivery, null: false, default: false
      t.boolean :cancel, null: false, default: false
      t.timestamps
    end
  end
end
