class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories

  def last_article
    articles.order('created_at DESC').first
  end

  def article_desc
    articles.order('created_at DESC').includes(:author)
  end
end
