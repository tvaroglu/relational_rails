class ParksController < ApplicationController
  def index
    @parks = Park.all.order(created_at: :desc)
  end

  def show
    @park = Park.find(params[:id])
  end
end
