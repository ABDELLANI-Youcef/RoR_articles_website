require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:votes) }
    it { should have_many(:articles) }
    it { should have_many(:voted_articles) }
  end
  describe 'validations' do
    subject { User.new(name: 'Youcef ABDELLANI') }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
  end
end
