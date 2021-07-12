require 'rails_helper'

RSpec.describe 'ski brands Index' do

  before(:each) do 
    @atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    @head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    @line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    @armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    @bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: @atomic.id)
    @vantage = Ski.create!(name:'Vantage 90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
    @arv106 = Ski.create!(name:'ARV 106', for_jumps:'true', turn_radius:20.5, ski_brand_id: @armada.id)
  end

  it 'has all of the ski brands' do

    visit '/ski_brands'

    expect(page).to have_content(@atomic.name)
    expect(page).to have_content(@head.name)
    expect(page).to have_content(@armada.name)
    expect(page).to have_content(@line.name)
  end

  it 'is sorted by most recently created' do

    visit '/ski_brands'

    expect(@atomic.name).to appear_before(@head.name)
    expect(@head.name).to appear_before(@line.name)
    expect(@line.name).to appear_before(@armada.name)
  end

  it '11 - has a link to create a new brand, which takes to form. Once submitted, returns to index and see new brand' do
    visit '/ski_brands'

    click_on('New Ski Brand')
    expect(current_path).to eq("/ski_brands/new")
    fill_in 'name', with: 'Head'
    select 'true', from: "does_racing"
    fill_in 'year_founded', with: '1959'
    click_on('submit')
    expect(current_path).to eq("/ski_brands")
    within("//tr[@id='Head']") do
      expect(page).to have_content('Head')
      expect(page).to have_content('1959')
      expect(page).to have_content('true')
    end
  end
end