class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category, null: false #カテゴリの外部キー
      t.string :item_name, null: false
      t.text :item_details, null: false
			t.integer :stock, null: false
			t.integer :price, null: false
			t.date :releace, null: false
      t.timestamps
    end
  end
end
