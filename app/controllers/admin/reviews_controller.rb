class Admin::ReviewsController < Admin::Base
  before_action :sign_out!
  before_action :admin_login_required

  def index
    @reviews = Review.order('id')
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :admin_reviews, notice: "レビューを削除しました"
  end
end