class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :nickname, null: false
      t.integer :sex, null: false, default: 1
      t.string :phone
      t.string :email
      t.date :birthday, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
