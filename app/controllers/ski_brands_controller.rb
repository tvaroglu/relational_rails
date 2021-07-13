class SkiBrandsController < ApplicationController
  def index
    @brands = SkiBrand.all
    if params[:sort] == 'ski_count'
      @brands = @brands.order_by_ski_count
    end
  end
  def show
    @brand = SkiBrand.find(params[:id])
    @ski_count = @brand.skis.count
  end

  def new
  end

  def create
    if SkiBrand.create(brand_params)
      redirect_to '/ski_brands'
    else
      redirect_to "/ski_brands/new"
      flash[:alert] = "Error: #{error_message(ski_brand.errors)}"
    end
  end

  def edit
    @ski_brand = SkiBrand.find(params[:id])
  end

  def update
    @ski_brand = SkiBrand.find(params[:id])
    if @ski_brand.update(brand_params)
      redirect_to '/ski_brands'
    else
      flash[:alert] = "Error: #{error_message(@ski_brand.errors)}"
      redirect_to '/ski_brands/edit'
    end
  end

  def delete
    SkiBrand.find(brand_params[:id]).delete
    redirect_to '/ski_brands'
  end
  private

  def brand_params
    params.permit(:id, :name, :does_racing, :year_founded)
  end
end
