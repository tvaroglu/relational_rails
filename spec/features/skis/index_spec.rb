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

  it '15 - only shows skis that are for jumps' do
    expect(page).to_not have_content('false')
  end

  it '18 - has an edit link for each ski' do
    within(@bentChetler.name) do
      click_on('edit')
    end
    expect(current_path).to eq("/skis/#{@bentChetler.id}/edit")
    fill_in 'name', with: 'Unbent Chetler'
    click_on('commit')
    expect(current_path).to eq("/skis")
    expect(page).to have_content('Unbent Chetler')
    expect(page).to_not have_content('Bent Chetler 100')
  end

  it '23 - has a delete button for each ski' do 
    expect(page).to have_content('Bent Chetler 100')
    within(@bentChetler.name) do
      click_on('delete')
    end
    expect(current_path).to eq("/skis")
    expect(page).to_not have_content('Bent Chetler 100')
  end
end