class ResortsController < ApplicationController

  def index
    @resorts = Resort.all
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    resort = Resort.find(params[:id])
    resort.update(resort_params)
    redirect_to "/resorts/#{resort.id}"
  end

  private
  def resort_params
    params.permit(:name, :country, :state_province, :active, :director_operations, :ttm_revenue_usd)
  end

end
