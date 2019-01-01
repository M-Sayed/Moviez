class MoviesController < ApplicationController
  before_action :set_movie, only: :show
  before_action :set_similar_movie, only: :show


  def search
    movie_search = MoviesSearch.call(params[:q], params[:page] || 1)
    @movies = movie_search.movies
    @page   = movie_search.page

    respond_to do |format|
      if movie_search.success?
        format.html
      else
        format.html { redirect_to root_path, error: 'Something went wrong.' }
      end
    end
  end

  def show; end

  private

  def set_movie
    @movie = Movie.find_by movie_id: params[:id]
    movie_details = MovieDetails.call(params[:id])
    redirect_to root_path unless movie_details.success? || @movie
    @movie ||= movie_details.movie
  end

  def set_similar_movie
    similar_movies = SimilarMovies.call(params[:id])
    @similar_movies = similar_movies.success? ? similar_movies.movies : []
  end
end
