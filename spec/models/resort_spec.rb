require 'rails_helper'

RSpec.describe Resort do
  describe 'relationships' do
    it {should belong_to(:region)}
  end

end
