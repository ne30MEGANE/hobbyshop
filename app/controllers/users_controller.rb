class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  def create
    @user = User.new(params[:user])
    if @user.save
        redirect_to :edit_account, notice: "新規会員登録が完了しました"
    else
        render 'new'
    end
  end

end
