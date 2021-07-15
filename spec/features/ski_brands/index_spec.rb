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
    visit '/ski_brands'
  end

  it '1 - has all of the ski brands' do
    expect(page).to have_content(@atomic.name)
    expect(page).to have_content(@head.name)
    expect(page).to have_content(@armada.name)
    expect(page).to have_content(@line.name)
  end

  it '6 - is sorted by most recently created' do
    expect(@atomic.name).to appear_before(@head.name)
    expect(@head.name).to appear_before(@line.name)
    expect(@line.name).to appear_before(@armada.name)
  end

  it '11 - has a link to create a new brand, which takes to form. Once submitted, returns to index and see new brand' do
    click_on('New Ski Brand')
    expect(current_path).to eq("/ski_brands/new")
    fill_in 'name', with: 'Volkl'
    check 'racing'
    fill_in 'year_founded', with: '1959'
    click_on('commit')
    expect(current_path).to eq("/ski_brands")
    within("//tr[@id='Volkl']") do
      expect(page).to have_content('Volkl')
      expect(page).to have_content('1959')
    end
  end

  it '17 - each brand has a link to edit, which updates and returns to /ski_brands' do
    within("//tr[@id='Head']") do
      click_on('Update Head')
    end
    expect(current_path).to eq("/ski_brands/#{@head.id}/edit")
    fill_in 'year_founded', with: '2005'
    click_on('commit')
    expect(current_path).to eq("/ski_brands/#{@head.id}")
    expect(page).to have_content("2005")
  end

  it '22 - has a delete button for each brand, which deletes it and returns to index' do
    within("//tr[@id='Head']") do
      click_on('Delete Head')
    end
    expect(current_path).to eq("/ski_brands")
    expect(page).to_not have_content("Head")
  end

  it 'has a button to sort ski brands by the number of skis they make' do
    click_on('sort by number of skis')
    expect(current_path).to eq("/ski_brands")
    expect('Atomic').to appear_before('Armada')
  end
end
