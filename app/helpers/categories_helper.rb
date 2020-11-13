module CategoriesHelper
  def vote_or_unvote_btn(article)
    return unless logged_in?
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Delete vote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: "btn btn-danger")
    else
      link_to('vote!', article_votes_path(article_id: article.id), method: :post, class: "btn btn-primary")
    end
  end

  def trunced_text(article)
    article.text[0...100]
  end
end
