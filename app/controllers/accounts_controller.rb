class AccountsController < ApplicationController
  before_action :login_required

  def edit
    @user = signed_in?
  end

  def update
    @user = signed_in?
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to :edit_account, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end
end
