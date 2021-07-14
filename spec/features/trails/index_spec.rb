require 'rails_helper'

RSpec.describe 'Trails index' do
  before :each do
    @park = Park.create!(name: "North Table Mountain",
      state: "CO",
      county: "Jefferson",
      parking_fee: 0,
      dogs_allowed: true)
    @trail_1 = @park.trails.create!(name: "North Table Loop",
      length: 38016,
      elevation_gain: 1059,
      loop: true)
    @trail_2 = @park.trails.create!(name: "Cottonwood Canyon Trail",
      length: 5280,
      elevation_gain: 320,
      loop: false)
  end

# User Story 3, Child Index
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'shows a list of trails including attributes' do

    visit '/trails'

    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_1.length)
    expect(page).to have_content(@trail_1.elevation_gain)
    expect(page).to have_content(@trail_1.loop)
  end

# User Story 9:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'shows link to the parks index' do
    visit "/trails"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end

# User Story 15, Child Index only shows `true` Records (x2)
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`
  it 'returns all trails that are a loop' do
    visit '/trails'

    expect(page).to have_content(@trail_1.name)
    expect(page).to_not have_content(@trail_2.name)
    expect(page).to_not have_content(@trail_2.length)
    expect(page).to_not have_content(@trail_2.elevation_gain)
    expect(page).to_not have_content(@trail_2.loop)
  end

# User Story 18, Child Update From Childs Index Page (x1)
  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'has a link to update an exisiting trail' do
    visit '/trails'

    click_on("Edit #{@trail_1.name}")

    expect(current_path).to eq("/trails/#{@trail_1.id}/edit")
  end
end
