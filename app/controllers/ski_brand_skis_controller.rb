class SkiBrandSkisController < ApplicationController
  def index
    @skis = SkiBrand.find(ski_params[:ski_brand_id]).skis
    @brand_id = ski_params[:ski_brand_id]
    if @skis != []
      @ski_min = SkiBrand.find(ski_params[:ski_brand_id]).skis.order('turn_radius asc').first.turn_radius
      @ski_max = SkiBrand.find(ski_params[:ski_brand_id]).skis.order('turn_radius desc').first.turn_radius
    end
    if params[:sort] == 'alpha'
      @skis = @skis.order_alphabetically('name')
    elsif params[:turn_radius]
      @skis = @skis.filter_by_turn_radius(ski_params[:turn_radius])
    end
  end

  def new 
    @brand_id = SkiBrand.find(ski_params[:ski_brand_id]).id
  end

  def create
    if SkiBrand.find(ski_params[:ski_brand_id]).skis.create(ski_params)
      redirect_to "/ski_brands/#{ski_params[:ski_brand_id]}/skis"
    end
    
  end

  def delete
    Ski.find(ski_params[:id]).delete
    redirect_to "/ski_brands/#{ski_params[:ski_brand_id]}/skis"
  end
  private

  def ski_params
    if params[:ski_id]
      params[:id] = params.delete :ski_id
    end
    params.permit(:id, :name, :for_jumps, :turn_radius, :ski_brand_id)
  end
end
