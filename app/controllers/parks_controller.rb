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
    Park.create!(park_params)
    redirect_to "/parks"
  end

  private
  def park_params
    params.permit(:name, :state, :county)
    # params.permit(state:)
    # params.permit(county:)
  end
end
