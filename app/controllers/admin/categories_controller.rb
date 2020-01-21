class Admin::CategoriesController < Admin::Base
  before_action :sign_out!
  before_action :admin_login_required

  def index
    @categories = Category.order("id")
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: "カテゴリを削除しました"
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path, notice: "カテゴリを登録しました"
    else
      render new_admin_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(params[:category])
    if @category.save
      redirect_to admin_categories_path, notice: "カテゴリ名を変更しました"
    else
      render edit_admin_category_path
    end
  end
end