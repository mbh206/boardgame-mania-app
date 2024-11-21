class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home
  def home
    
    @boardgames = Boardgame.all.map { |object| object.poster}
    puts "hello from home #{@boardgames.count}"
  end
end
