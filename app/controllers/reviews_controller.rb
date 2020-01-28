class ReviewsController < ApplicationController
  before_action :login_required, except: :new

  def index
    @reviews = signed_in?.reviews
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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :reviews, notice: "レビューを削除しました"
  end
end
