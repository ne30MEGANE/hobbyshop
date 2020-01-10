class ApplicationController < ActionController::Base
    def menu_link_to(text, path, options = {})
        content_tag :li do
            link_to_unless_current(text, path, options) do
                content_tag(:span, text)
            end
        end
    end
    
    private def signed_in? #ログインされてるかどうか
        User.find_by(email: session[:user_id]) if session[:user_id]
    end
    helper_method :signed_in?
end
