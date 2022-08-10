class Admin::CategoriesController < ApplicationController
  before_action :find_category, except: %i(new create index)
  before_action :get_all_category, only: %i(index new edit destroy)
  def index; end

  def show; end

  def new
    @category = Category.new
    respond_to do |format|
      format.html{render "_new"}
      format.json{render json: @category}
      format.js
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attribute(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.delete
      redirect_to
    else
      render :destroy
    end
  end

  private

  def category_params
    params.require(:category).permit Category::ATTR_CATE
  end

  def find_category
    @category = Category.find(params[:id])
    return if @category

    flash[:danger] = "category not found"
    redirect_to admin_categories_path
  end

  def get_all_category
    @categories = Category.all
  end
end
