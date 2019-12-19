class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
		  t.string :name, null: false
			t.integer :stock, null: false
			t.integer :price, null: false
			t.date :releace, null: false
      t.timestamps
    end
  end
end
