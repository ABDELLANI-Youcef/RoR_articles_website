class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :author_id, presence: true
  validates :text, presence: true, length: { minimum: 10 }
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :user_voted, through: :votes, source: :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  has_one :image_element, dependent: :destroy
end
