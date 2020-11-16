require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  let(:user) { User.create(name: 'Youcef ABDELLANI') }
  let(:article) { user.articles.create(title: 'First article', text: 'Youcef ABDELLANI is making a test ') }
  let(:category) {Category.create(name: 'Technology', priority: 0)}
  let(:article_category) {article.article_categories.new(category: category)}
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:article) }
  end

  describe 'validations' do
    # subject { article.article_categories.new(category: category) }
    subject {article_category}
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:article) }
    it { should validate_uniqueness_of(:article).scoped_to(:category_id) }
  end
end
