class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, length: { minimum: 3 }
end
