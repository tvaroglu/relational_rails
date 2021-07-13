class ParkTrailsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    @trails = @park.trails
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
