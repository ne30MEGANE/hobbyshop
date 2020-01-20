class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
    before_action :remove_errors, only: :add_item

    def show
        @details = current_cart.details.order("item_id")
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
        @detail.update(quantitiy: params[:quantitiy].to_i)
        redirect_to current_cart
    end
    
    def delete_item
        @detail.destroy
        redirect_to current_cart
    end
    
    private
    def setup_cart_item!
        @detail = current_cart.details.find_by(item_id: params[:item_id])
    end
    def remove_errors
        session.delete(:errors)
    end
end
