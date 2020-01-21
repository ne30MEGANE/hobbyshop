class Admin::CategoriesController < Admin::Base
  def index
    @categories = Category.order("id")
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: "カテゴリを削除しました"
  end
end