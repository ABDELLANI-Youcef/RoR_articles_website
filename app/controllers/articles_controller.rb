class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.build(article_params)
    if article.save # if valid
      article.image_element = ImageElement.new(image_params)

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

  def image_params
    params.require(:article).permit(:image)
  end
end
