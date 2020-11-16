class Vote < ApplicationRecord
  validates :user, :article, presence: true
  validates :user_id, uniqueness: { scope: :article_id }
  belongs_to :user
  belongs_to :article
end
