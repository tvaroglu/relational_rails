require 'rails_helper'

RSpec.describe SkiBrand do
  describe "relationships" do
    it {should have_many :skis}
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
    describe "::order_by_ski_count" do
      it 'returns the ski_brands ordered by the number of skis they make' do
        expect(SkiBrand.all[0]).to eq(@atomic)
        expect(SkiBrand.all[1]).to eq(@head)
        expect(SkiBrand.all[2]).to eq(@line)
        expect(SkiBrand.all[3]).to eq(@armada)

        expect(SkiBrand.order_by_ski_count[0]).to eq(@atomic)
        expect(SkiBrand.order_by_ski_count[1]).to eq(@armada)
        expect(SkiBrand.order_by_ski_count[2]).to eq(@head)
      end
    end
  end
  describe "instance methods" do
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
    describe "#ski_count" do
      it 'returns the number of skis the brand makes' do
        expect(@head.ski_count).to eq(1)
        expect(@armada.ski_count).to eq(2)
        expect(@atomic.ski_count).to eq(3)
      end
    end
  end
end

