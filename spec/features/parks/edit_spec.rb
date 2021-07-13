require 'rails_helper'

RSpec.describe 'Park update' do
# User Story 12, Parent Update (x2)
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'can update a park' do
    park = Park.create!(name: "South Table Mtn",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)
    
    visit "/parks/#{park.id}"

    click_link 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}/edit")

    fill_in('Name', with: 'South Table Mountain')
    click_on 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}")
    expect(page).to have_content('South Table Mountain')
  end
end
