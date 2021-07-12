class RegionsController < ApplicationController

  def index
    @regions = Region.all.order(created_at: :desc)
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
  end

  def create
    region = Region.create(region_params)
    redirect_to "/regions"
  end

  def resorts
    @region = Region.find(params[:id])
    @resorts = @region.resorts
  end

private
  def region_params
    params.permit(:name, :active, :rvp_operations, :priority)
  end

end
