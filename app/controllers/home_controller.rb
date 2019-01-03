class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @favorite_list  = user_signed_in? && current_user.favorite_list
    @popular_movies = PopularMovies.call.movies
    @top_movies     = TopMovies.call.movies
  end
end
