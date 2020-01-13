class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  def create
    @user = User.new()
    if @user.save
        redirect to @user, notice: "新規会員登録が完了しました"
    else
        render 'new'
    end
  end
end
