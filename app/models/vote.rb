class Vote < ApplicationRecord
  validates :user, :article, presence: true
  validates :user, uniqueness: { scope: :article_id }
  belongs_to :user
  belongs_to :article
end
