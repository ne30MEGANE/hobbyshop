class Admin::OrdersController < Admin::Base
  before_action :sign_out!
  before_action :admin_login_required
  
  def index #注文履歴一覧
    @orders = Order.order(id: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @details = Detail.where(cart_id: @order.cart_id)
    @user = User.find(@order.user_id)
  end

  def delivery #発送管理
    @order = Order.find(params[:id])
    if @order.cancel? #キャンセル済の注文に対して呼ばれた場合
      redirect_back fallback_location: 'index', notice: "注文はキャンセルされています"
    else
      if @order.delivery? #発送済→取り消し
        @order.delivery = 0
        @order.save
        redirect_back fallback_location: 'index', notice: "発送済みを取り消しました"
      else #未発送→発送済み
        @order.delivery = 1
        @order.save
        redirect_back fallback_location: 'index', notice: "発送済にしました"
      end
    end
  end
end