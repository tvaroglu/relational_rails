class SkisController < ApplicationController

  def index
    @skis = Ski.all
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

  def edit
    @ski = Ski.find(ski_params[:id])
    @ski_brands = SkiBrand.all
  end

  def update
    Ski.find(ski_params[:id]).update(ski_params)
    redirect_to "/skis/#{ski_params[:id]}"
  end

  def delete
    binding.pry
  end
  private

  def ski_params
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
 