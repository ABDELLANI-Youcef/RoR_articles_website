class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  has_many :articles, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article
end
