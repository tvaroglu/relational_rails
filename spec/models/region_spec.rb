require 'rails_helper'

RSpec.describe Region do
  describe 'relationships' do
    # it {should have_many(:resorts)}
    it 'has many children' do
      region = Region.reflect_on_association(:resorts)
      expect(region.macro).to eq(:has_many)
    end
  end

end
