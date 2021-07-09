class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end

  def resorts
    @region = Region.find(params[:id])
    @resorts = @region.resorts
  end

end
