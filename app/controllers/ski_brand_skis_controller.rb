class SkiBrandSkisController < ApplicationController
  def index
    @skis = SkiBrand.find(params[:id]).skis
    if params[:sort] == 'alpha'
      @skis = SkiBrand.find(params[:id]).skis.order('name desc')
    end
  end

  def new 
  end

  def create
    if SkiBrand.find(ski_params[:id]).skis.create(ski_params)
      redirect_to "/ski_brands/#{ski_params[:id]}/skis"
    end
    
  end
  private

  def ski_params
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
