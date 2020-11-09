class Vote < ApplicationRecord
  validates :user, :article, presence: true
  validates :user, uniqueness: { scope: :article }
  belongs_to :user
  belongs_to :article
end
