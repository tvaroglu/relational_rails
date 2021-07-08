require 'rails_helper'

RSpec.describe Region do
  it {should have_many :resorts}
end
