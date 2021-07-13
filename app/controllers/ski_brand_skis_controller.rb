class SkiBrandSkisController < ApplicationController
  def index
    @skis = SkiBrand.find(params[:id]).skis
    @brand_id = params[:id]
    @ski_min = SkiBrand.find(params[:id]).skis.order('turn_radius asc').first.turn_radius
    @ski_max = SkiBrand.find(params[:id]).skis.order('turn_radius desc').first.turn_radius
    if params[:sort] == 'alpha'
      @skis = @skis.skis.order_alphabetically('name')

    elsif params[:turn_radius]
      @skis = @skis.where('turn_radius > ?', ski_params[:turn_radius])
    end
  end

  def new 
  end

  def create
    if SkiBrand.find(ski_params[:ski_brand_id]).skis.create(ski_params)
      redirect_to "/ski_brands/#{ski_params[:ski_brand_id]}/skis"
    end
    
  end
  private

  def ski_params
    if params[:id]
      params[:ski_brand_id] = params.delete :id
    end
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
