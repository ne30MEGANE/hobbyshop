class PasswordsController < ApplicationController
  before_action :login_required
  
  def show
    redirect_to :account
  end

  def edit
    @user = signed_in?
  end

  def update
    @user = signed_in?
    current_password = params[:account][:current_password]

    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(params[:account])
        if @user.save
          redirect_to :edit_account, notice: "パスワードを変更しました"
        else
          render "edit"
        end
      else
        @user.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @user.errors.add(:current_password, :empty)
      render "edit"
    end
  end

end
