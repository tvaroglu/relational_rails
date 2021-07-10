require 'rails_helper'

RSpec.describe 'User Story 2 - Park Show' do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'shows the specified park and lists attributes' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    visit "/parks/#{park.id}"

    expect(page).to have_content(park.name)
    expect(page).to have_content("State: #{park.state}")
    expect(page).to have_content("County: #{park.county}")
    expect(page).to have_content("Parking Fee: $#{park.parking_fee}")
    expect(page).to have_content("Dogs Allowed: #{park.dogs_allowed}")
  end

  # User Story 7
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'shows the count of the number of trails associated with the specified park' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    trail_1 = park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
    trail_2 = park.trails.create!(name: "Cottonwood Canyon Trail",
                          length: 5280,
                          elevation_gain: 320,
                          loop: false)
    visit "/parks/#{park.id}"

    expect(page).to have_content("#{park.trails.length} Trails")
  end
end
