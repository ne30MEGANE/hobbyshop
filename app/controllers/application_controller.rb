class ApplicationController < ActionController::Base
    private def signed_in? #ログインされてるかどうか
        User.find_by(email: session[:user_id]) if session[:user_id]
    end
    helper_method :signed_in?
end
