class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    article = current_user.articles.build(article_params)
    article_categories = params[:article][:category_ids]
    if article_categories.nil?
      flash[:error] = "you should select at least one category"
      redirect_to new_article_path
    elsif article.save
      article.image_element = ImageElement.new(image_params) unless image_params.nil?

      article_categories.each do |ac|
        unless ac.empty?
          category_of_article = article.article_categories.build(category_id: ac)
          category_of_article.save
        end
      end
      flash[:notice] = "The article #{article.title} has been successfully created."
      redirect_to root_path
    else
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  

  def update
    @article = Article.find(params[:id])
      if @article.update_attributes(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to current_user
      else
        flash[:error] = "Something went wrong"
        redirect_to current_user
      end
  end
  

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'Something went wrong'
      redirect_back(fallback_location: root_path)
    end
  end
  

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def image_params
    params.require(:article).permit(:image)
  end

  def categories_params
    params.require(:article).permit(:category_ids)
  end
  
end
