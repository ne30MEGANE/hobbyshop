class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
    before_action :remove_errors, only: :add_item

    def show
        @details = current_cart.details.order("item_id")
        @stock_over = check_stock()

    end
    
    def add_item
        if @detail.blank?
            @detail = current_cart.details.build(item_id: params[:item_id])
        end
        @detail.quantitiy += params[:quantitiy].to_i
        if @detail.save
            redirect_to Item.find(params[:item_id]), notice: "商品をカートに追加しました"    
        else
            session[:errors] = @detail.errors.full_messages.to_json
            redirect_to Item.find(params[:item_id])
        end
    end
    
    def update_item
        @detail.update(quantitiy: params[:detail][:quantitiy].to_i)
        redirect_to current_cart, notice: "カート内の商品の個数を変更しました"
    end
    
    def delete_item
        @detail.destroy
        redirect_to current_cart, notice: "商品をカートから削除しました"
    end
    
    private
    def setup_cart_item!
        @detail = current_cart.details.find_by(item_id: params[:item_id])
    end
    def remove_errors #ブラウザでnumberフィールドのmin消したりとか意地悪いことされたとき用
        session.delete(:errors)
    end
    def check_stock
        items_id = []
        @details = current_cart.details
        @details.each do |detail|
            kosuu = detail.quantitiy
            stock = Item.find(detail.item_id).stock
            if kosuu > stock
                items_id.push(detail.item_id)
            end
        end
        items_id #在庫が足りない商品のID一覧を配列で返す
    end
end
