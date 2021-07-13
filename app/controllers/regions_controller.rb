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
    Region.create(region_params)
    redirect_to '/regions'
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    region = Region.find(params[:id])
    region.update(region_params)
    redirect_to "/regions/#{region.id}"
  end

  def resorts
    @region = Region.find(params[:id])
    @resorts = @region.resorts
  end

  def new_resort
    @region = Region.find(params[:id])
  end

  def create_new_resort
    region = Region.find(params[:id])
    region.resorts.create(resort_params)
    redirect_to "/regions/#{region.id}/resorts"
  end

  private
  def region_params
    params.permit(:name, :active, :rvp_operations, :priority)
  end

  private
  def resort_params
    params.permit(:name, :country, :state_province, :active, :director_operations, :ttm_revenue_usd)
  end

end
