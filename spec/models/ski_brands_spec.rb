require 'rails_helper'

RSpec.describe SkiBrand, type: :model do
  describe 'validations' do
    it {should have_many(:skis)}
  end
  describe 'validations' do
    # it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:does_racing) }
    # it { should validate_presence_of(:year_founded) }
  end
  describe 'class methods' do
  end
  describe 'Instance Methods' do
  end
end