class ShowsController < ApplicationController
  def index
    @shows = @movie.shows
  end

  def show
    @show = Show.find(params[:id])
    @seats = @show.seats
  end
end
