class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @article_categories = Category.all.map{ |element| @article.article_categories.build(category_id: element.id)}
  end

  def create
    article = current_user.articles.build(article_params)
    
    if article.save # if valid
      article.image_element = ImageElement.new(image_params)

      article_categories = params[:categories][:id]

      article_categories.each do |ac|
        unless ac.empty?
          category_of_article = article.article_categories.build(category_id: ac)
          category_of_article.save
        end
      end
      flash[:notice] = "The article #{article.title} has been successfully created."
      redirect_to root_path
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

  def categories_params
    params.require(:categories).permit(:id)
  end
  
end
