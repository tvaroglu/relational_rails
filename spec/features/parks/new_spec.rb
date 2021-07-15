require 'rails_helper'

RSpec.describe 'Parks new' do
  it 'links to the new page from the parks index' do
    visit '/parks'

    click_link('New Park')

    expect(current_path).to eq('/parks/new')
  end

  it 'can create a new park' do
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
