class RegionsController < ApplicationController

  def index
    @regions = Region.all.order(created_at: :desc)
  end

  def show
    @region = Region.find(params[:id])
  end

  def resorts
    @region = Region.find(params[:id])
    @resorts = @region.resorts
  end

end
