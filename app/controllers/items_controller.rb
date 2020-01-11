class ItemsController < ApplicationController
  def index #トップページ
    @items = Item.order("releace")
  end
end
