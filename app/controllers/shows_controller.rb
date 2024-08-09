class ShowsController < ApplicationController
  before_action :find_movies_show
  def index
    @shows = @movie.shows
  end

  def show
    @show = @movie.shows.find(params[:id])
  end

  private
  def find_movies_show
    @movie = Movie.find(params[:movie_id])
  end
end
