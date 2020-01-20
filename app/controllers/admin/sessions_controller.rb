class Admin::SessionsController < Admin::Base
    before_action :sign_out!
    before_action :admin_login_required, except: [:new, :create] #ログインページは普通にアクセス

    def new
        
    end
    
    def create
        admin = Admin.find_by(admin_name: params[:admin_name])
        if admin&.authenticate(params[:password])
            session[:admin_id] = admin.admin_name
            redirect_to '/admin'
        else
            flash.alert = "管理者IDかパスワードが間違っています"
            render 'new'
        end
    end

    def destroy
        session.delete(:admin_id)
        session.delete(:cart_id)
        redirect_to :root
    end
end
