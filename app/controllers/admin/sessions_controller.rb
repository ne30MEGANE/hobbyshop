class SessionsController < Admin::Base
    def new
        
    end
    
    def create
        admin = Admin.find_by(admin_name: params[:admin_name])
        if admin&.authenticate(params[:password])
            session[:admin_id] = admin.admin_name
            redirect_to :root
        else
            flash.alert = "メールアドレスかパスワードが間違っています"
            render 'new'
        end
    end

    def destroy
        session.delete(:admin_id)
        redirect_to :root
    end
end
