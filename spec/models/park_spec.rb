require 'rails_helper'

RSpec.describe Park do
  it {should have_many :trails}

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

  it 'counts the number of trails associated with the specified park' do
    expect(@park.trails_count).to eq(2)
  end

  it 'orders trails in aplhabetical order' do
    expect(@park.sort_trails_alphabetically.length).to eq(2)
    expect(@park.sort_trails_alphabetically.first).to eq(@trail_2)
    expect(@park.sort_trails_alphabetically.last).to eq(@trail_1)
  end

  it 'displays only trail records over a given threshhold' do
    expect(@park.filter_by_elevation(1000).length).to eq(1)
    expect(@park.filter_by_elevation(1000).first).to eq(@trail_1)
    expect(@park.filter_by_elevation(1000)).to_not include(@trail_2)
  end
end
