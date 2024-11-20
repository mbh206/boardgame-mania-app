class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boardgames = Boardgame.all
  end

  #before action: Boardgame.find(params[:id])
  def show

  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end
end
