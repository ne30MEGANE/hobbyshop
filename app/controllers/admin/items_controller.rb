class Admin::ItemsController < Admin::Base
  def index #トップページ
    @items = Item.order("releace")
  end

  def show #商品詳細
    @item = Item.find(params[:id])
  end

  def edit #商品情報編集画面
    @item = Item.find(params[:id])
    @categories = Category.order("id")
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

  def new
    @item = Item.new(category_id: 1, releace: Time.zone.now )
    @categories = Category.order("id")
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to admin_item_path(@item), notice: "新しい商品を登録しました"
    else
      render "new"
    end
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
