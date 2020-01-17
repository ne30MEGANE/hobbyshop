class Admin::Base < ApplicationController
    private
    def admin_login_required
        raise Forbidden unless current_admin
    end
    def current_admin
        if session[:admin_id]
            Admin.find_by(admin_name: session[:admin_id])
        end
    end
    def sign_out! #管理者ページにアクセスするときに一般会員でログインしてたら
        if session[:user_id] #ログアウトさせるやつ
            session.delete(:user_id)
        end
    end
    helper_method :current_admin
end