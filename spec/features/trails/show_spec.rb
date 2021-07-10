require 'rails_helper'

RSpec.describe 'User Story 4 - Trails Show' do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'displays the name of the specified trail along with attributes' do
    trail = Trail.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.name)
    expect(page).to have_content("Length: #{trail.length}")
    expect(page).to have_content("Elevation Gain: #{trail.elevation_gain}")
    expect(page).to have_content("Loop: #{trail.loop}")
  end
end
