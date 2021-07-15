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

  it 'has a list of trails including their attributes' do
    visit '/trails'

    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_1.length)
    expect(page).to have_content(@trail_1.elevation_gain)
    expect(page).to have_content(@trail_1.loop)
  end

  it 'has a link to the parks index' do
    visit "/trails"

    click_on "Parks Index"

    expect(current_path).to eq('/parks')
  end

  it 'lists only loop trails (true case)' do
    visit '/trails'

    expect(page).to have_content(@trail_1.name)
    expect(page).to_not have_content(@trail_2.name)
    expect(page).to_not have_content(@trail_2.length)
    expect(page).to_not have_content(@trail_2.elevation_gain)
    expect(page).to_not have_content(@trail_2.loop)
  end

  it 'has a link to update an exisiting trail' do
    visit '/trails'

    click_on("Edit #{@trail_1.name}")

    expect(current_path).to eq("/trails/#{@trail_1.id}/edit")
    expect(page).to have_content(@trail_1.name)
  end

  it 'has a link that deletes an existing trail' do
    visit '/trails'

    click_on("Delete #{@trail_1.name}")

    expect(current_path).to eq('/trails')
    expect(page).to_not have_content(@trail_1.name)
  end
end
