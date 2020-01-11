class ItemsController < Admin::Base
  def index #トップページ
    @items = Item.order("releace")
  end
end
