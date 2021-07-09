require 'rails_helper'

RSpec.describe Resort do
  it {should belong_to :region}
end
