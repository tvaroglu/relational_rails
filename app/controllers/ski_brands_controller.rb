class SkiBrandsController < ApplicationController
  def index
    @brands = SkiBrand.all
  end
end
