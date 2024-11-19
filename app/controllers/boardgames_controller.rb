class BoardgamesController < ApplicationController

  before_action :set_boardgame, only: %i[show]
  
  #before action: Boardgame.find(params[:id])
  def show
    #TODO
  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end

end
