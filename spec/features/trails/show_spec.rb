require 'rails_helper'

RSpec.describe 'the trails show page' do
  it 'displays the name of the trail' do
    trail_1 = Trail.create!(name: "North Table Loop",
                          length: 38016,
                          elevation_gain: 1059,
                          loop: true)
    trail_2 = Trail.create!(name: "Cottonwood Canyon Trail",
                          length: 5280,
                          elevation_gain: 320,
                          loop: false)

    visit "/trails/#{trail.id}"
  end
end
