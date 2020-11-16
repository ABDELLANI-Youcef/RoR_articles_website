require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { User.create(name: 'Youcef ABDELLANI') }
  let(:article) { user.articles.create(title: 'First article', text: 'Youcef ABDELLANI is making a test ') }
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe 'validations' do
    subject { user.votes.new(article: article) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:article) }
    it { should validate_uniqueness_of(:user).scoped_to(:article_id) }
  end
end
