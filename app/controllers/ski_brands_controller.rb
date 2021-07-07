class SkiBrandsController < ApplicationController
  def index
    @brands = SkiBrand.all
  end
  def show
    @brand = SkiBrand.find(params[:id])
  end
end
