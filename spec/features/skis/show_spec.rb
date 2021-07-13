require 'rails_helper'

RSpec.describe 'skis Show' do
  xit 'has only the ski with given id' do
    atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: atomic.id)
    vantage = Ski.create!(name:'Vantage 90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: atomic.id)
    arv106 = Ski.create!(name:'ARV 106', for_jumps:'true', turn_radius:20.5, ski_brand_id: armada.id)

    visit "/skis/#{vantage.id}"

    expect(page).to have_content(vantage.name)
    expect(page).to_not have_content(vantage.name)
    expect(page).to_not have_content(arv106.name)

  end
end
