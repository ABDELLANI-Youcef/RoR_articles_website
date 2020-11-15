# rubocop:disable Metrics/PerceivedComplexity
module CategoriesHelper
  def vote_or_unvote_btn(article)
    return unless logged_in?

    # vote = Vote.find_by(article: article, user: current_user)
    vote = current_user.voted_article?(article)
    if vote
      link_to('Delete vote!', article_vote_path(id: vote.id, article_id: article.id),
              method: :delete, class: 'btn btn-danger')
    else
      link_to('vote!', article_votes_path(article_id: article.id), method: :post, class: 'btn btn-primary')
    end
  end

  def trunced_text(article)
    article.text[0...100]
  end

  def show_articles(articles)
    first_article = articles.first
    content = if first_article.image_element.nil?
                render 'article_default_image'
              else
                render 'article_image', article: first_article
              end
    content.concat render 'article_description', article: first_article
    articles.each_with_index do |article, index|
      next if index.zero?

      if (index / 2).even?
        if article.image_element.image.present?
          content.concat render 'article_image', article: article
        else
          content.concat render 'article_default_image'
        end
        content.concat render 'article_description', article: article
      else
        content.concat render 'article_description', article: article
        content.concat render 'article_image', article: article
      end
    end
    content
  end

  def index_best_article(best_article)
    if best_article.nil?
      render 'no_best_article'
    else
      render 'best_article', best_article: best_article
    end
  end

  def index_category_last_article(category)
    article = category.last_article
    render 'homepage_article', article: article, category: category unless article.nil?
  end

  def index_article_image(article)
    if article.image_element.nil?
      image_tag 'default.jpg', class: 'w-100 h-100'
    else
      image_tag article.image_element.image, class: 'w-100 h-100'
    end
  end
end

# rubocop:enable Metrics/PerceivedComplexity
