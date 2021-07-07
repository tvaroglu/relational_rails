require 'rails_helper'

RSpec.describe 'ski brands Index' do

  it 'has all of the ski brands' do
    atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    visit '/ski_brands'
    expect(page).to have_content(atomic.name)
    expect(page).to have_content(head.name)
    expect(page).to have_content(armada.name)
    expect(page).to have_content(line.name)
  end
end