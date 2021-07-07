require 'rails_helper'

RSpec.describe Ski, type: :model do
  describe 'validations' do
    it {should belong_to(:ski_brand)}
  end
  describe 'validations' do
    # it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:for_jumps) }
    # it { should validate_presence_of(:turn_radius) }
  end
  describe 'class methods' do
  end
  describe 'Instance Methods' do
  end
end