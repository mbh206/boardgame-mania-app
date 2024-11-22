class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home
  def home

    @boardgames = Boardgame.all
  end
end
