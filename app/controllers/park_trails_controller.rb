class ParkTrailsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    if "#{params[:sorted]}" == 'true'
      @trails = @park.sort_trails_alphabetically
    elsif params[:elevation_gain] != nil
      @trails = @park.filter_by_elevation(params[:elevation_gain])
    else
      @trails = @park.trails
    end
  end

  def new
    @park = Park.find(params[:id])
  end

  def create
    @park = Park.find(params[:id])
    @park.trails.create(trails_params)
    redirect_to "/parks/#{@park.id}/trails"
  end

  private
  def trails_params
    params.permit(:name, :length, :elevation_gain, :loop)
  end
end
