class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :item, null: false #商品
      t.references :order, null: false #注文書
      t.integer :quantitiy, null: false, default: 1 #個数
      t.timestamps
    end
  end
end
