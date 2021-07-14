require 'rails_helper'

RSpec.describe 'Trails update' do
# User Story 14, Child Update (x2)
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it 'has a link to update existing trail' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    trail = park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)

    visit "/trails/#{trail.id}"

    click_on('Update Trail')

    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end

  it 'can update an existing trail' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    trail = park.trails.create!(name: "North Tble Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)

    visit "trails/#{trail.id}/edit"

    fill_in('Name', with: 'North Table Loop')

    click_on('Update Trail')

    expect(current_path).to eq("/trails/#{trail.id}")
    expect(page).to have_content('North Table Loop')
  end
end
