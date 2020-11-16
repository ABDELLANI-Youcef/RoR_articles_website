require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { Category.new(name: 'Technology', priority: 0) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3)}
  end
end
