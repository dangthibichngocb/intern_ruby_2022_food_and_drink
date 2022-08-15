class Admin::CategoriesController < ApplicationController
  before_action :find_category, except: %i(new create index)
  before_action :get_all_category, only: %i(index destroy)
  def index; end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t ".alert_success_create"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t ".alert_err_create"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = t ".alert_success_update"
      redirect_to admin_categories_path
    else
      flash[:danger] = t ".alert_err_update"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".alert_success_delete"
    else
      flash[:danger] = t ".alert_err_delete"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit Category::ATTR_CATE
  end

  def find_category
    @category = Category.find(params[:id])
    return if @category

    flash[:danger] = t ".not_found"
    redirect_to admin_categories_path
  end

  def get_all_category
    @pagy, @categories = pagy Category.latest_category,
                              items: 5
  end
end
