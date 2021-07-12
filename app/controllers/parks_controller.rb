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
    park = Park.create(name: params[:name])
    redirect_to "/parks/#{park.id}"
  end
end
