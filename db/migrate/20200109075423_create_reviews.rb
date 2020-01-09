class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false #書いた人
      t.references :item, null: false #商品名
      t.integer :score
      t.text :text
      t.timestamps
    end
  end
end
