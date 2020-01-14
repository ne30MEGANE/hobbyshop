class ApplicationController < ActionController::Base
    private def signed_in? #ログインされてるかどうか
        User.find_by(email: session[:user_id]) if session[:user_id]
    end
    helper_method :signed_in?

    private def current_cart #@orderを返す
        if session[:order_id]
            @order = Order.find(session[:order_id])
        else
            @order = Order.create() #新しく作って
            session[:order_id] = @order.id #セッションにidを保存して
            @order #orderおｂｊを返す
        end
    end
    helper_method :current_cart

    class LoginRequired < StandardError; end
    class Forbidden < StandardError; end
    
    private def login_required
        raise LoginRequired unless signed_in?
    end
end
