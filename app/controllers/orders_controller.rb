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
    @orders = Order.where(user_id: signed_in?.id).page(params[:page]).per(20)
  end

  def show
    @order = Order.find(params[:id])
    @details = Detail.where(cart_id: @order.cart_id)
  end

  def cancel
    @order = Order.find(params[:id])
    if @order.cancel? #万が一キャンセル済の注文に対して呼ばれた場合
      redirect_back fallback_location: 'index', notice: "すでにキャンセルされた注文です"
    else
      if @order.delivery? #これもないとは思うけど万が一発送の注文だった場合
        redirect_back fallback_location: 'index', notice: "この注文は発送済みのためキャンセルはできません"
      else #注文がまだキャンセルされてなくて、かつ発送もまだの注文
        @order.cancel = 1
        @order.save
        redirect_back fallback_location: 'index', notice: "注文をキャンセルしました"
      end
    end
  end

  private
  def remove_cart_item
    session.delete(:cart_id)
  end
end
