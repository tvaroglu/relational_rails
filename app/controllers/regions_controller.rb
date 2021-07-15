class RegionsController < ApplicationController

  def index
    if params[:commit] == "Sort by Resort Count"
      @regions = Region.sorted_by_resort_count
    else
      @regions = Region.ordered_by_created_date
    end
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

  def destroy
    region = Region.find(params[:id])
    region.resorts.destroy_all
    region.destroy
    redirect_to '/regions'
  end

  def resorts
    # could utilize a new route (tradeoff vs lengthier controller methods)
      # would want to look into splitting out when we reach ~4-5 params
    @region = Region.find(params[:id])
    if "#{params[:sorted]}" == 'true'
      @resorts = @region.sort_resorts_alphabetically
    elsif params[:ttm_revenue_usd] != nil
      @resorts = @region.filter_resorts_by(params[:ttm_revenue_usd])
    else
      @resorts = @region.resorts.all
    end
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
