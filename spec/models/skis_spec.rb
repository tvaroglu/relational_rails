require 'rails_helper'

RSpec.describe Ski do
  describe "relationships" do
    it {should belong_to :ski_brand}
  end
  describe "class methods" do
    before(:each) do
      @atomic = SkiBrand.create!(name:'Atomic', does_racing:'true', year_founded:1955)
      @head = SkiBrand.create!(name:'Head', does_racing:'true', year_founded:1950)
      @line = SkiBrand.create!(name:'Line', does_racing:'false', year_founded:1995)
      @armada = SkiBrand.create!(name:'Armada', does_racing:'false', year_founded:2002)
      @bentChetler = Ski.create!(name:'Bent Chetler 100', for_jumps:'true', turn_radius:19.5, ski_brand_id: @atomic.id)
      @vantage = Ski.create!(name:'Vantage90 Ti', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
      @arv106 = Ski.create!(name:'ARV106', for_jumps:'true', turn_radius:20.5, ski_brand_id: @armada.id)
      @redster = Ski.create!(name:'RedsterG9', for_jumps:'false', turn_radius:18.4, ski_brand_id: @atomic.id)
      @declivity = Ski.create!(name:'Declivity92TI', for_jumps:'true', turn_radius:17.5, ski_brand_id: @armada.id)
      @kore = Ski.create!(name:'Kore99', for_jumps:'true', turn_radius:18.6, ski_brand_id: @head.id)
    end
    describe "::filter_by_turn_radius" do
      it 'returns only skis that have a turn radius greater than user input' do
        expect(Ski.filter_by_turn_radius(20.5)).to eq([])
        expect(Ski.filter_by_turn_radius(20.4)).to include(@arv106)
        expect(Ski.filter_by_turn_radius(20.4)).to_not include(@kore)
        expect(Ski.filter_by_turn_radius(18.4)).to include(@kore)
        expect(Ski.filter_by_turn_radius(18.4)).to_not include(@redster)
      end 
    end
    describe "::boolean_true" do
      it "returns only the skis which are for jumps" do
        expect(Ski.boolean_true).to include(@kore)
        expect(Ski.boolean_true).to_not include(@redster)
      end
    end
  end

end