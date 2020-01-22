class OrdersController < ApplicationController
  before_action :login_required, except: [:new]

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

  def index #注文履歴一覧
    @orders = Order.where(user_id: signed_in?.id)
  end

  def show
    @order = Order.find(params[:id])
    @details = Detail.where(cart_id: params[:id])
  end

  private
  def remove_cart_item
    session.delete(:cart_id)
  end
end
