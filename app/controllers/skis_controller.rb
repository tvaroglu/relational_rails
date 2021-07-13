class SkisController < ApplicationController

  def index
  end

  def show
    @ski = Ski.find(params[:id])
  end

  def new
    @ski_brands = SkiBrand.all
  end

  def create
    if Ski.create(ski_params)
      redirect_to '/skis'
    end
  end

  private

  def ski_params
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
 