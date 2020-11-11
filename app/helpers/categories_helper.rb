module CategoriesHelper
  def vote_or_unvote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Delete vote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('vote!', article_votes_path(article_id: article.id), method: :post)
    end
  end
end
