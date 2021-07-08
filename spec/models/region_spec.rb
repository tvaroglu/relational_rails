require 'rails_helper'

RSpec.describe Region do
  describe 'relationships' do
    it {should have_many(:resorts)}
  end

end
