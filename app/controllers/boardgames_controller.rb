class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index  # Steve update to index
     # Get the search query from params
     @query = params[:query]
     @boardgames = Boardgame.order(name: :asc)
     # If there's a query, filter by both name and category
     if @query.present?
       @boardgames = Boardgame.where("name ILIKE ? OR category ILIKE ?", "%#{@query}%", "%#{@query}%")
     else
       @boardgames
     end
  end

  #before action: Boardgame.find(params[:id])
  def show

  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end
end
