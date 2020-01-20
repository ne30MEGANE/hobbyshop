class ApplicationController < ActionController::Base
    private def signed_in? #ログインされてるかどうか
        User.find_by(email: session[:user_id]) if session[:user_id]
    end
    helper_method :signed_in?

    private def current_cart #@orderを返す
        if session[:cart_id]
            @cart = Cart.find(session[:cart_id])
        else
            @cart = Cart.create #新しく作って
            session[:cart_id] = @cart.id #セッションにidを保存して
            @cart #cartおｂｊを返す
        end
    end
    helper_method :current_cart

    class LoginRequired < StandardError; end
    class Forbidden < StandardError; end
    
    private def login_required
        raise LoginRequired unless signed_in?
    end
end
