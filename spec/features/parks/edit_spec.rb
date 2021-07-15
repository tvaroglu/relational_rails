require 'rails_helper'

RSpec.describe 'Park update' do
  it 'can update a park' do
    park = Park.create!(name: "South Table Mtn",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: false)

    visit "/parks/#{park.id}"

    expect(page).to have_content(park.name)

    click_link 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}/edit")

    fill_in('Name', with: 'South Table Mountain')
    click_on 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}")
    expect(page).to have_content('South Table Mountain')
  end
end
