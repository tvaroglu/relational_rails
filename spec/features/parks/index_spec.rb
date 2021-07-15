require 'rails_helper'

RSpec.describe 'Park index' do
  before :each do
    @park_1 = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    @park_2 = Park.create!(name: "Chatauqua Park",
                        state: "CO",
                        county: "Boulder",
                        parking_fee: 5,
                        dogs_allowed: true)
  end

  it 'lists the name of each park record in the system' do
    visit '/parks'

    expect(page).to have_content(@park_1.name)
    expect(page).to have_content(@park_2.name)
    expect(page).to have_content("Created At: #{@park_1.created_at}")
    expect(page).to have_content("Created At: #{@park_2.created_at}")
  end

  it 'lists park records ordered by most recently created first' do
    visit '/parks'

    expect(@park_2.name).to appear_before(@park_1.name)
  end

  it 'has a link to the trails index' do
    visit '/parks'

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

  it 'it has a link to edit an exisiting park' do
    visit '/parks'

    click_on("Edit #{@park_1.name}")

    expect(current_path).to eq("/parks/#{@park_1.id}/edit")
    expect(page).to have_content(@park_1.name)

    visit '/parks'

    click_on("Edit #{@park_2.name}")

    expect(current_path).to eq("/parks/#{@park_2.id}/edit")
    expect(page).to have_content(@park_2.name)
  end

  it 'has a link that deletes an exisiting park' do
    visit '/parks'

    click_on("Delete #{@park_1.name}")

    expect(current_path).to eq('/parks')
    expect(page).to_not have_content(@park_1.name)

    click_on("Delete #{@park_2.name}")

    expect(current_path).to eq('/parks')
    expect(page).to_not have_content(@park_2.name)
  end
end
