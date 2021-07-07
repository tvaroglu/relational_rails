require 'rails_helper'

RSpec.describe 'ski brands Show' do

  before(:each) do
    atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: atomic.id)
    vantage = Ski.create!(name:'Vantage 90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: atomic.id)
    arv106 = Ski.create!(name:'ARV 106', for_jumps:'true', turn_radius:20.5, ski_brand_id: armada.id)
  end

  it 'has only the parent with given id' do
    visit "/ski_brands/#{atomic.id}"
    expect(page).to have_content(atomic.name)
    expect(page).to_not have_content(head.name)
    expect(page).to_not have_content(armada.name)
    expect(page).to_not have_content(line.name)
  end

  it 'has the number of skis manufactured by this brand' do
    visit "/ski_brands/#{atomic.id}"
    expect(page).to have_content("Number of ski currently made: 2")
  end

  it 'has a link to see the skis from this brand' do
    visit "/ski_brands/#{atomic.id}"
    expect(page).to have_link("#{atomic.name} Skis")
    click_on("#{atomic.name} Skis")
    expect(current_path).to eq("/ski_brands/#{atomic.id}/skis")
  end
end