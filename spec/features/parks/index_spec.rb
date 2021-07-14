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

# User Story 1:
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'shows the name of each park record in the system' do
    visit '/parks'

    expect(page).to have_content(@park_1.name)
    expect(page).to have_content(@park_2.name)
    expect(page).to have_content("Created At: #{@park_1.created_at}")
    expect(page).to have_content("Created At: #{@park_2.created_at}")
  end

# User Story 6:
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it 'shows park records ordered by most recent first' do
    visit '/parks'

    expect(@park_2.name).to appear_before(@park_1.name)
  end

# User Story 8:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'shows link to the trails index' do
    visit '/parks'

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

# User Story 17, Parent Update From Parent Index Page (x2)
  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parents edit page where I can update its information just like in User Story 4
  it 'it has a link to edit an exisiting park' do
    visit '/parks'

    click_on("Edit #{@park_1.name}")

    expect(current_path).to eq("/parks/#{@park_1.id}/edit")

    visit '/parks'

    click_on("Edit #{@park_2.name}")

    expect(current_path).to eq("/parks/#{@park_2.id}/edit")
  end

# User Story 22, Parent Delete From Parent Index Page (x1)
  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to delete that parent
  # When I click the link
  # I am returned to the Parent Index Page where I no longer see that parent
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
