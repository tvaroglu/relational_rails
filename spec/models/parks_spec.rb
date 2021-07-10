require 'rails_helper'

RSpec.describe Park do
  it {should have_many :trails}
end
