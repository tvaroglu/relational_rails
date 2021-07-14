require 'rails_helper'

RSpec.describe 'Parks trails index' do
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

# User Story 5
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'shows all the trails along with attributes for the specified park' do
    visit "/parks/#{@park.id}/trails"

    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
    expect(page).to have_content("Length: #{@trail_1.length}")
    expect(page).to have_content("Length: #{@trail_2.length}")
    expect(page).to have_content("Elevation Gain: #{@trail_1.elevation_gain}")
    expect(page).to have_content("Elevation Gain: #{@trail_2.elevation_gain}")
    expect(page).to have_content("Loop: #{@trail_1.loop}")
    expect(page).to have_content("Loop: #{@trail_2.loop}")
  end

# User Story 8:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'shows link to the trails index' do
    visit "/parks/#{@park.id}/trails"

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

# User Story 9:
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'shows link to the parks index' do
    visit "/parks/#{@park.id}/trails"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end

# User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  it 'has link to sort trails alphabetically' do
    visit "/parks/#{@park.id}/trails"

    click_on 'Sort Alphabetically'

    expect(current_path).to eq("/parks/#{@park.id}/trails")
    expect(@trail_2.name).to appear_before(@trail_1.name)
  end

# User Story 18, Child Update From Childs Index Page (x1)
  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'has a link to update an exisiting trail' do
    visit "/parks/#{@park.id}/trails"

    click_on("Edit #{@trail_1.name}")

    expect(current_path).to eq("/trails/#{@trail_1.id}/edit")

    visit "/parks/#{@park.id}/trails"

    click_on("Edit #{@trail_2.name}")

    expect(current_path).to eq("/trails/#{@trail_2.id}/edit")
  end

  # User Story 21, Display Records Over a Given Threshold (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    xit 'displays only trail records over a given threshhold' do
      visit "/parks/#{@park.id}/trails"

      fill_in

      click_on("Only return records with more than 'number' of 'column_name'")

      expect(current_path).to eq("/parks/#{@park.id}/trails")
      expect(page).to have_content()
      expect(page).to_not have_content()
    end
end
