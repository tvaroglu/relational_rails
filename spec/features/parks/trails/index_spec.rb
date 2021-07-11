require 'rails_helper'

RSpec.describe 'User Story 5 - Parks trails index' do
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'shows all the trails along with attributes for the specified park' do
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
                          
    visit "/parks/#{park.id}/trails"

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content("Length: #{trail_1.length}")
    expect(page).to have_content("Length: #{trail_2.length}")
    expect(page).to have_content("Elevation Gain: #{trail_1.elevation_gain}")
    expect(page).to have_content("Elevation Gain: #{trail_2.elevation_gain}")
    expect(page).to have_content("Loop: #{trail_1.loop}")
    expect(page).to have_content("Loop: #{trail_2.loop}")
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
    # trail = park.trails.create!(name: "North Table Loop",
    #                       length: 38016,
    #                       elevation_gain: 1059,
    #                       loop: true)

    visit "/parks/#{park.id}/trails"

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end
end
