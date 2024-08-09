class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])

    if params[:show_id]
      @show = @movie.shows.find(params[:show_id])
    else
      @show = @movie.shows.first
    end

    render :show
  end
end
