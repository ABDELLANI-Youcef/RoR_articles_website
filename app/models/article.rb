class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :user_id, presence: true
  validates :text, presence: true, length: { minimum: 10 }
  belongs_to :user
end
