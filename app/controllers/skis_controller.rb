class SkisController < ApplicationController

  def index
    @skis = Ski.where('for_jumps = true')
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
    Ski.find(ski_params[:id]).delete
    redirect_to "/skis"
  end
  private

  def ski_params
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
 