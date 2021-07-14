require 'rails_helper'

RSpec.describe 'Parks new' do
  it 'links to the new page from the parks index' do
# User Story 11, Parent Creation
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  visit '/parks'

  click_link('New Park')

  expect(current_path).to eq('/parks/new')
  end

  it 'can create new park' do
    park = Park.create!(name: "South Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)

    visit '/parks/new'

    fill_in('Name', with: park.name)
    fill_in('State', with: park.state)
    fill_in('County', with: park.county)
    fill_in('Parking Fee', with: park.parking_fee)
    select('No', from: 'Dogs Allowed?')
    click_button('Create Park')

    expect(current_path).to eq("/parks")
    expect(page).to have_content(park.name)
    expect(page).to have_content(park.created_at)
  end
end
