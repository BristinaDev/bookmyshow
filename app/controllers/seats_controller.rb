class SeatsController < ApplicationController
  before_action :find_movie_seats
  
  def index
    @seats = @show.seats
  end

  private

  def find_movie_seats
    @movie = Movie.find(params[:id])
    @show = @movie.shows.find(params[:id])
  end
end
