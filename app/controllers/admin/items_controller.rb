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

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])
    if @item.save
      redirect_to admin_item_path(@item), notice: "商品情報を更新しました"
    else
      render "edit"
    end
  end

end
