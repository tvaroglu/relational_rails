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
end
