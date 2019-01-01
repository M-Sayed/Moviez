class MovieFinder < ApplicationService
  attr_reader :movie

  def initialize(movie_id)
    @movie_id = movie_id
    @errors   = []
  end

  def call
    @movie = Movie.find_by movie_id: @movie_id
    unless @movie
      movie_details = MovieDetails.call(@movie_id)
      if movie_details.success?
        @movie = movie_details.movie
      else
        @errors = movie_details.errors
      end
    end

    self
  end
end
