require 'rails_helper'

RSpec.describe 'Park trails creation' do
  it 'has a link to create a new trail for a park' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)

    visit "/parks/#{park.id}/trails"

    click_on 'Create Trail'

    expect(current_path).to eq("/parks/#{park.id}/trails/new")
  end

  it 'can create a new trail for a park' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)
    trail = park.trails.create!(name: "South Table Loop",
                          length: 328075,
                          elevation_gain: 1000,
                          loop: true)

    visit "/parks/#{park.id}/trails/new"

    fill_in('Name', with: trail.name)
    fill_in('Length', with: trail.length)
    fill_in('Elevation Gain', with: trail.elevation_gain)
    select('Yes', from: 'Loop?')

    click_on('Create Trail')

    expect(current_path).to eq("/parks/#{park.id}/trails")
    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.length)
    expect(page).to have_content(trail.elevation_gain)
    expect(page).to have_content(trail.loop)
  end
end
