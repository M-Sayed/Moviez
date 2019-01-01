class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @favorite_list  = current_user.favorite_list
    @popular_movies = PopularMovies.call.movies
    @top_movies     = TopMovies.call.movies
  end
end
