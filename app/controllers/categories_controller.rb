class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end
  
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to @category
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # update
end
