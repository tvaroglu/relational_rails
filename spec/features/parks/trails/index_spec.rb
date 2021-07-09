require 'rails_helper'

RSpec.describe 'User Story 1: Park index' do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'shows the name of each park record in the system' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        parking_capacity: 100,
                        dogs_allowed: true)
    park = Park.create!(name: "Chatauqua Park",
                        state: "CO",
                        county: "Boulder",
                        parking_fee: 5,
                        parking_capacity: 500,
                        dogs_allowed: true)
    visit '/parks'

    expect(page).to have_content(park.name)
  end
end
