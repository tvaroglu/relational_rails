require 'rails_helper'

RSpec.describe 'Region creation' do
# User Story 11, Parent Creation (x3)
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  it 'links to the new page from the Region index' do
    visit '/regions'
    # save_and_open_page

    click_on 'New Region'
    expect(current_path).to eq('/regions/new')
  end

  it 'can create a new region do' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit 'regions/new'
    # save_and_open_page

    fill_in('Name', with: region.name)
    fill_in('Currently Active', with: region.active)
    fill_in('RVP of Operations', with: region.rvp_operations)
    fill_in('Priority', with: region.priority)
    click_button('Create Region')

    expect(current_path).to eq("/regions")
    expect(page).to have_content(region.name)
    expect(page).to have_content(region.created_at)
  end
end
