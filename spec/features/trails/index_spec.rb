require 'rails_helper'

RSpec.describe 'User Story 3 - Trails index' do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'shows a list of trails including attributes' do
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

    visit '/trails'

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content(trail_1.length)
    expect(page).to have_content(trail_2.length)
    expect(page).to have_content(trail_1.elevation_gain)
    expect(page).to have_content(trail_2.elevation_gain)
    expect(page).to have_content(trail_1.loop)
    expect(page).to have_content(trail_2.loop)
  end

  # User Story 9:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'shows link to the parks index' do
    visit "/trails"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end
end
