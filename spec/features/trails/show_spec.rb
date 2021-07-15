require 'rails_helper'

RSpec.describe 'Trails Show' do
  before :each do
    @park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)
    @trail = @park.trails.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
  end

  it 'displays the name of the specified trail along with attributes' do
    visit "/trails/#{@trail.id}"

    expect(page).to have_content(@trail.name)
    expect(page).to have_content("Length: #{@trail.length}")
    expect(page).to have_content("Elevation Gain: #{@trail.elevation_gain}")
    expect(page).to have_content("Loop: #{@trail.loop}")
  end

  it 'has a link to the trails index' do
    visit "/trails/#{@trail.id}"

    click_on "Trails Index"

    expect(current_path).to eq('/trails')
  end

  it 'has a link to the parks index' do
    visit "/trails/#{@trail.id}"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end

  it 'has a link to delete an existing trail' do
    visit "/trails/#{@trail.id}"

    click_on('Delete Park')

    expect(current_path).to eq('/trails')

    visit '/trails'

    expect(page).to_not have_content(@trail.name)
  end
end
