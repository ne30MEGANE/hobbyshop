class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user #購入者
      t.datetime :time
      t.integer :pay, null: false, default: 0
      t.boolean :delivery, null: false, default: false
      t.boolean :cancel, null: false, default: false
      t.timestamps
    end
  end
end
