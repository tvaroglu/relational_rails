class ParkTrailsController < ApplicationController
  def index
    park = Park.find(params[:park_id])
    @trails = park.trails
  end
end
