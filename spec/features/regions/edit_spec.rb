require 'rails_helper'

RSpec.describe 'region edit page' do
  # User Story 12, Parent Update (x3)
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'links to the edit form' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)
    visit "/regions/#{region.id}"
    # save_and_open_page
    click_on 'Update Region'

    expect(current_path).to eq("/regions/#{region.id}/edit")
  end

  it 'can edit the region' do
    region = Region.create!(
      name: 'US - Rocky Mountainssss',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)
    visit "/regions/#{region.id}"
    # save_and_open_page

    expect(page).to have_content(region.name)

    click_on 'Update Region'
    fill_in('Name:', with: 'US - Rocky Mountain')
    choose 'Yes'
    fill_in('RVP of Operations:', with: region.rvp_operations)
    select(region.priority, from: 'Priority')
    click_button 'Update Region'

    expect(current_path).to eq("/regions/#{region.id}")
    expect(page).to_not have_content(region.name)
    expect(page).to have_content(region.active)
    expect(page).to have_content(region.rvp_operations)
    expect(page).to have_content(region.priority)
  end
end
