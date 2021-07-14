require 'rails_helper'

RSpec.describe Park do
  it {should have_many :trails}

  before :each do
    @park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    @trail_1 = @park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
    @trail_2 = @park.trails.create!(name: "Cottonwood Canyon Trail",
                          length: 5280,
                          elevation_gain: 320,
                          loop: false)
  end
# User Story 7
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'counts the number of trails associated with the specified park' do
    expect(@park.trails_count).to eq(2)
  end

# User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  it 'orders trails in aplhabetical order' do
    expect(@park.sort_trails_alphabetically.length).to eq(2)
    expect(@park.sort_trails_alphabetically.first).to eq(@trail_2)
    expect(@park.sort_trails_alphabetically.last).to eq(@trail_1)
  end

# User Story 21, Display Records Over a Given Threshold (x2)
  # As a visitor
  # When I visit the Parent's children Index Page
  # I see a form that allows me to input a number value
  # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
  # Then I am brought back to the current index page with only the records that meet that threshold shown.
  xit 'displays only trail records over a given threshhold' do

  end
end
