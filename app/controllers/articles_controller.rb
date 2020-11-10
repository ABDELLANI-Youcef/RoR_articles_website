class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.build(article_params)
    if article.save
      flash[:notice] = "The article #{article.title} has been successfully created."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
