class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article

  def articles_desc
    self.articles.order('created_at DESC').includes(:votes)
  end
end
