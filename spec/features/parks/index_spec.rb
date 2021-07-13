require 'rails_helper'

RSpec.describe 'Park index' do
  # User Story 1:
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'shows the name of each park record in the system' do
    park_1 = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    park_2 = Park.create!(name: "Chatauqua Park",
                        state: "CO",
                        county: "Boulder",
                        parking_fee: 5,
                        dogs_allowed: true)
    visit '/parks'

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_2.name)
    expect(page).to have_content("Created At: #{park_1.created_at}")
    expect(page).to have_content("Created At: #{park_2.created_at}")
  end

  # User Story 6:
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it 'shows park records ordered by most recent first' do
    park_1 = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    park_2 = Park.create!(name: "Chatauqua Park",
                        state: "CO",
                        county: "Boulder",
                        parking_fee: 5,
                        dogs_allowed: true)
    visit '/parks'

    expect(park_2.name).to appear_before(park_1.name)
  end

  # User Story 8:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'shows link to the trails index' do
    visit '/parks'

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end
end
