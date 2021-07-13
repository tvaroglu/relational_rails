require 'rails_helper'

RSpec.describe 'Park trails creation' do
# User Story 13, Parent Child Creation (x2)
  # As a visitor
  # When I visit a Parent Childs Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed
  it 'has a link to create a new trail for a park' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)

    visit "/parks/#{park.id}/trails"

    click_on 'Create Trail'

    expect(current_path).to eq("/parks/#{park.id}/trails/new")
  end

  it 'can create a new trail for a park' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)
    trail = park.trails.create!(name: "South Table Loop",
                          length: 328075,
                          elevation_gain: 1000,
                          loop: true)

    visit "/parks/#{park.id}/trails/new"

    fill_in('Name', with: trail.name)
    fill_in('Length', with: trail.length)
    fill_in('Elevation Gain', with: trail.elevation_gain)
    select('Yes', from: 'Loop?')

    click_on('Create Trail')

    expect(current_path).to eq("/parks/#{park.id}/trails")
    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.length)
    expect(page).to have_content(trail.elevation_gain)
    expect(page).to have_content(trail.loop)
  end
end
