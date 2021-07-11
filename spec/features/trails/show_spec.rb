require 'rails_helper'

RSpec.describe 'User Story 4 - Trails Show' do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'displays the name of the specified trail along with attributes' do
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

    expect(page).to have_content(trail.name)
    expect(page).to have_content("Length: #{trail.length}")
    expect(page).to have_content("Elevation Gain: #{trail.elevation_gain}")
    expect(page).to have_content("Loop: #{trail.loop}")
  end

  # User Story 8:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'shows link to the trails index' do
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

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

  # User Story 9:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'shows link to the parks index' do
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

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end
end
