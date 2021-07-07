require 'rails_helper'

RSpec.describe 'application layout' do

  it 'has a link that goes to skis index' do
    visit '/'
    expect(page).to have_link("All Skis")
    visit '/ski_brands'
    expect(page).to have_link("Ski Brands")
  end

  it 'has a link that goes to ski brands index' do
    visit '/'
    expect(page).to have_link("Ski Brands")
    visit '/skis'
    expect(page).to have_link("Ski Brands")
  end

end