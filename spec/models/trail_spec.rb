require 'rails_helper'

RSpec.describe Trail do
  it {should belong_to :park}

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

  it 'returns all trails that are a loop(true)' do
    expect(Trail.loop_trails.length).to be(1)
    expect(Trail.loop_trails.first).to eq(@trail_1)
    expect(Trail.loop_trails).to_not include(@trail_2)
  end
end
