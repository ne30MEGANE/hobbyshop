class ReviewsController < ApplicationController
  before_action :login_required

  def index
    
  end

  def new
    if signed_in? 
      @review = Review.new(user_id: signed_in?.id)
      @review.score = 5
      @item = Item.find(params[:item_id])
    else
      redirect_to '/login', notice: "先にログインをしてください"
    end
  end

  def create
    @item = Item.find(params[:review][:item_id])
    @review = Review.new(params[:review])
    if @review.save
      redirect_to @item, notice: "レビューを投稿しました"
    else
      render 'reviews/new'
    end
  end
end
