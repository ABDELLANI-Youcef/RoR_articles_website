module UsersHelper
  def articles_shows(articles)
    render "table", articles: @articles
  end
end
