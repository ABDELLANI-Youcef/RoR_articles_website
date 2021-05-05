class ArticleCategory < ApplicationRecord
  validates :article, :category, presence: true
  validates :article, uniqueness: { scope: :category_id }
  belongs_to :article
  belongs_to :category
end
