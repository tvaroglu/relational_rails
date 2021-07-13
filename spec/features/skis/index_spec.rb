require 'rails_helper'

RSpec.describe 'skis Index' do
  before(:each) do
    @atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    @head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    @line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    @armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    @bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: @atomic.id)
    @vantage = Ski.create!(name:'Vantage 90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
    @arv106 = Ski.create!(name:'ARV 106', for_jumps:'true', turn_radius:20.5, ski_brand_id: @armada.id)
    
    visit '/skis'
  end
  it 'has all of the skis' do

    expect(page).to have_content(@bentChetler.name)
    expect(page).to have_content(@vantage.name)
    expect(page).to have_content(@arv106.name)

  end

  it '13 - has a link to create new ski, which returns to index with newly created ski' do
    click_on('Create Ski')
    expect(current_path).to eq("/skis/new")
    fill_in 'name', with: 'Kore 99'
    fill_in 'turn_radius', with: '18.5'
    click_on('commit')
    expect(current_path).to eq("/skis")
    expect(page).to have_content("Kore 99")
  end

  it '16 - has a link to sort skis alphabetically' do
    click_on('Sort Alphabetically')
    expect('ARV 106').to appear_before('Bent Chetler 100')
    expect('Bent Chetler 100').to appear_before('Vantage 90 Ti')
  end
end