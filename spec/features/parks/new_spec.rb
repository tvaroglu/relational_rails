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

  xit 'can create new park' do
    visit '/parks/new'

    fill_in('Name', with: 'South Table Mountain')
    fill_in('State', with: 'CO')
    fill_in('County', with: 'Jefferson')
    fill_in('Parking Fee', with: 'zero')
    fill_in('Dogs Allowed', with: 'false')
    click_button('Create Park')

    expect(current_path).to be("/parks/")
    expect(page).to have_content('South Table Mountain')
    expect(page).to have_content("State: CO")
    expect(page).to have_content("County: Jefferson")
    expect(page).to have_content("Parking Fee: 0")
    expect(page).to have_content("Dogs Allowed: false")
  end
end
