class CategoriesController < ApplicationController
  def show
    # n+1 queries problem (try to load athors name eager load)
    @category = Category.find(params[:id])
    @articles = @category.articles.order('created_at DESC').includes(:user)
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
    @articles = @categories.map { |category| category.articles.last }
    group = Article.all.includes(:votes)
    count = group.map { |article| article.votes.size }.max
    @best_article = group.select { |article| article.votes.size == count }.first
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

  # update
end
