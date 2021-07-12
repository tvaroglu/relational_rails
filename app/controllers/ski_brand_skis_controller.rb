class SkiBrandSkisController < ApplicationController
  def index
    @skis = SkiBrand.find(params[:id]).skis
  end
end
