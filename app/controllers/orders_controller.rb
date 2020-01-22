class OrdersController < ApplicationController
  def new #注文確認画面
    if signed_in?.present?
      @order = Order.new(cart_id: current_cart.id)
      @details = current_cart.details.order("item_id")
      @user = signed_in?
    else
      redirect_to '/login', notice: "先にログインをしてください"
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.save
    session.delete(:cart_id)
  end

  private
  def remove_cart_item
    session.delete(:cart_id)
  end
end
