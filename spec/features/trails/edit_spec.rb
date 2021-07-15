require 'rails_helper'

RSpec.describe 'Trails update' do
  it 'has a link to update existing trail' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    trail = park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)

    visit "/trails/#{trail.id}"

    click_on('Update Trail')

    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end

  it 'can update an existing trail' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    trail = park.trails.create!(name: "North Tble Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)

    visit "trails/#{trail.id}/edit"

    fill_in('Name', with: 'North Table Loop')
    fill_in('Length', with: 38017)
    fill_in('Elevation Gain', with: 1050)
    select('No', from: 'Loop')

    click_on('Update Trail')

    expect(current_path).to eq("/trails/#{trail.id}")
    expect(page).to have_content('North Table Loop')
    expect(page).to have_content(38017)
    expect(page).to have_content(1050)
    expect(page).to have_content('No')
    expect(page).to_not have_content('North Tble Loop')
    expect(page).to_not have_content(38018)
    expect(page).to_not have_content(1059)
    expect(page).to_not have_content('Yes')
  end
end
