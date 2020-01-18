class Admin::ItemsController < Admin::Base
  def index #トップページ
    @items = Item.order("releace")
  end

  def show #商品詳細
    @item = Item.find(params[:id])
  end

  def edit #商品情報編集画面
    @item = Item.find(params[:id])
  end
  
end
