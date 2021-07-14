require 'rails_helper'

RSpec.describe Park do
  it {should have_many :trails}

# User Story 7
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'counts the number of trails associated with the specified park' do
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

    expect(park.trails_count).to eq(2)
  end
end
