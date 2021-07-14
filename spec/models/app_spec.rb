require 'rails_helper'

RSpec.describe ApplicationRecord do

  describe 'class methods' do
    describe '::order_alphabetically' do
      before(:each) do
        @atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
        @head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
        @line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
        @armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
        @vantage = Ski.create!(name:'Vantage90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
        @bentChetler = Ski.create!(name:'Bent Chetler100', for_jumps:'true', turn_radius:19.5, ski_brand_id: @atomic.id)
        @arv106 = Ski.create!(name:'ARV106', for_jumps:'true', turn_radius:20.5, ski_brand_id: @armada.id)
      end
      it 'sorts a table or subset by a given column in descending order' do
        expect(@atomic.skis[0]).to eq(@vantage)
        expect(@atomic.skis[1]).to eq(@bentChetler)
        expect(@atomic.skis.order_alphabetically('name')[0]).to eq(@bentChetler)
        expect(@atomic.skis.order_alphabetically('name')[1]).to eq(@vantage)
      end
    end
  end
end