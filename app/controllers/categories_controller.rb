class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.article_desc
  end

  def index
    @categories = Category.all.includes(:articles)
    @best_article = Article.best_article
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = 'Category successfully created'
      redirect_to @category
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end
end
