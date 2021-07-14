class ResortsController < ApplicationController

  def index
    @resorts = Resort.only_true
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

  def destroy
    resort = Resort.find(params[:id])
    resort.destroy
    redirect_to '/resorts'
  end

  private
  def resort_params
    params.permit(:name, :country, :state_province, :active, :director_operations, :ttm_revenue_usd)
  end

end
