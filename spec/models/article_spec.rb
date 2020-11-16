require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: 'Youcef ABDELLANI') }
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:votes) }
    it { should have_many(:user_voted) }
    it { should have_many(:article_categories) }
    it { should have_many(:categories) }
    it { should have_one(:image_element) }
  end
  describe 'validations' do
    subject { user.articles.create(title: 'First article', text: 'Youcef ABDELLANI is making a test ') }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_least(10) }
  end
end
