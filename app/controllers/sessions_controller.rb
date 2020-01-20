class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.email
            redirect_to :root
        else
            flash.alert = "メールアドレスかパスワードが間違っています"
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        session.delete(:cart_id)
        redirect_to :root
    end
end
