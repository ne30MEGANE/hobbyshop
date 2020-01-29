class ItemsController < ApplicationController
  def index #トップページ
    @items = Item.order("releace").page(params[:page]).per(30)
  end

  def show #商品詳細
    @item = Item.find(params[:id])
  end

  def search
    @items = Item.search(params[:q])
    render "index"
  end

  def select
    @items = Item.where(category_id: params[:c])
    render "index"
  end
end
