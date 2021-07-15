require 'rails_helper'

RSpec.describe 'Parks trails index' do
  before :each do
    @park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    @trail_1 = @park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
    @trail_2 = @park.trails.create!(name: "Cottonwood Canyon Trail",
                          length: 5280,
                          elevation_gain: 320,
                          loop: false)
  end

  it 'shows all the trails along with attributes for the specified park' do
    visit "/parks/#{@park.id}/trails"

    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
    expect(page).to have_content("Length: #{@trail_1.length}")
    expect(page).to have_content("Length: #{@trail_2.length}")
    expect(page).to have_content("Elevation Gain: #{@trail_1.elevation_gain}")
    expect(page).to have_content("Elevation Gain: #{@trail_2.elevation_gain}")
    expect(page).to have_content("Loop: #{@trail_1.loop}")
    expect(page).to have_content("Loop: #{@trail_2.loop}")
  end

  it 'shows link to the trails index' do
    visit "/parks/#{@park.id}/trails"

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

  it 'shows link to the parks index' do
    visit "/parks/#{@park.id}/trails"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end

  it 'has link to sort trails alphabetically' do
    visit "/parks/#{@park.id}/trails"

    click_on 'Sort Alphabetically'

    expect(current_path).to eq("/parks/#{@park.id}/trails")
    expect(@trail_2.name).to appear_before(@trail_1.name)
  end

  it 'has a link to update an exisiting trail' do
    visit "/parks/#{@park.id}/trails"

    click_on("Edit #{@trail_1.name}")

    expect(current_path).to eq("/trails/#{@trail_1.id}/edit")

    visit "/parks/#{@park.id}/trails"

    click_on("Edit #{@trail_2.name}")

    expect(current_path).to eq("/trails/#{@trail_2.id}/edit")
  end

  it 'displays only trail records over a given threshhold' do
    visit "/parks/#{@park.id}/trails"

    fill_in('Elevation Gain', with: 1000)

    click_on('Filter Trails')

    expect(current_path).to eq("/parks/#{@park.id}/trails")
    expect(page).to have_content(@trail_1.name)
    expect(page).to_not have_content(@trail_2.name)
  end
end
