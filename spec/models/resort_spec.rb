require 'rails_helper'

RSpec.describe Resort do
  describe 'relationships' do
    # it {should belong_to(:region)}
    it 'belongs to a region' do
      resort = Resort.reflect_on_association(:region)
      expect(resort.macro).to eq(:belongs_to)
    end
  end

end
