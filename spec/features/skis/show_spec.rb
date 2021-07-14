require 'rails_helper'

RSpec.describe 'skis Show' do

  before(:each) do
    @atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
    @head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
    @line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
    @armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
    @bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: @atomic.id)
    @vantage = Ski.create!(name:'Vantage 90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
    @arv106 = Ski.create!(name:'ARV 106', for_jumps:'true', turn_radius:20.5, ski_brand_id: @armada.id)
    
    visit "/skis/#{@vantage.id}"
  end
  it '4 - has only the ski with given id' do

    expect(page).to have_content(@vantage.name)
    expect(page).to_not have_content(@arv106.name)

  end

  it '14 - has a link to update ski, updates and returns, showing change' do
    click_on('Update')
    expect(current_path).to eq("/skis/#{@vantage.id}/edit")
    fill_in 'name', with: 'disadvantage'
    click_on('commit')
    expect(current_path).to eq("/skis/#{@vantage.id}")
    expect(page).to_not have_content('Vantage')
    expect(page).to have_content('disadvantage')
  end

  it '20 - has a delete link, which deletes ski and returns to ski index' do
    click_on('Delete')
    expect(current_path).to eq("/skis")
    expect(page).to_not have_content('Vantage')
  end
end