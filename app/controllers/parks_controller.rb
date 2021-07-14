class ParksController < ApplicationController
  def index
    @parks = Park.all.order(created_at: :desc)
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    Park.create(park_params)
    redirect_to "/parks"
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params)
    redirect_to "/parks/#{park.id}"
  end

  def destroy
    park = Park.find(params[:id])
    park.trails.destroy_all
    park.destroy
    redirect_to '/parks'
  end

  private
  def park_params
    params.permit(:name, :state, :county, :parking_fee, :dogs_allowed)
  end
end
