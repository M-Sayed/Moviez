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

  def favorite
    favorite_movie = FavoriteMovie.call(current_user, params[:movie_id])
    respond_to do |format|
      if favorite_movie.success?
        format.json
      else
        format.json {
          render json: { errors: favorite_movie.errors },
                 status: :unprocessable_entity
        }
      end
    end
  end

  def unfavorite
    favorite_movie = FavoriteMovie.call(current_user, params[:movie_id], true)
    respond_to do |format|
      if favorite_movie.success?
        format.json
      else
        format.json {
          render json: { errors: favorite_movie.errors },
                 status: :unprocessable_entity
        }
      end
    end
  end

  private

  def set_movie
    movie_finder = MovieFinder.call(params[:id])
    redirect_to root_path unless movie_finder.success?
    @movie = movie_finder.movie
  end

  def set_similar_movie
    similar_movies = SimilarMovies.call(params[:id])
    @similar_movies = similar_movies.success? ? similar_movies.movies : []
  end
end
