require 'rails_helper'

RSpec.describe 'Park Show' do
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

  it 'shows the specified park and lists attributes' do
    visit "/parks/#{@park.id}"

    expect(page).to have_content(@park.name)
    expect(page).to have_content("State: #{@park.state}")
    expect(page).to have_content("County: #{@park.county}")
    expect(page).to have_content("Parking Fee: $#{@park.parking_fee}")
    expect(page).to have_content("Dogs Allowed: #{@park.dogs_allowed}")
  end

  it 'shows the count of the number of trails associated with the specified park' do
    visit "/parks/#{@park.id}"

    expect(page).to have_content("#{@park.trails_count} Trails")
  end

  it 'shows link to the parks index' do
    park = Park.create!(name: "North Table Mountain",
                        state: "CO",
                        county: "Jefferson",
                        parking_fee: 0,
                        dogs_allowed: true)

    visit "/parks/#{@park.id}"

    click_on "#{@park.name}"

    expect(current_path).to eq("/parks/#{@park.id}/trails")
  end

  it 'has a link that deletes an existing park' do
    visit "/parks/#{@park.id}"

    click_on('Delete Park')

    expect(current_path).to eq('/parks')

    visit '/parks'

    expect(page).to_not have_content(@park.name)

    visit '/trails'

    expect(page).to_not have_content(@trail_1.name)
    expect(page).to_not have_content(@trail_2.name)
  end
end
