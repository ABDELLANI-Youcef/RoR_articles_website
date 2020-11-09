class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
end
