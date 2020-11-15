class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.article_desc
  end

  def index
    @categories = Category.all.includes(:articles)
    if @categories.nil?
      a = Category.create(name: 'Technology', priority: 0)
      a.save
      a = Category.create(name: 'Books', priority: 1)
      a.save
      a = Category.create(name: 'History', priority: 2)
      a.save
      a = Category.create(name: 'News', priority: 3)
      a.save
      @categories = Category.all.includes(:articles)
    end
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
