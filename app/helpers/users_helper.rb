module UsersHelper
  def articles_shows(_articles)
    render 'table', articles: @articles
  end
end
