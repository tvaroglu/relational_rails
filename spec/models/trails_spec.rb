require 'rails_helper'

RSpec.describe Trail do
  it {should belong_to :park}
end
