class SimilarMovies < TheMoviesDatabaseService
  attr_reader :movies

  def initialize(movie_id)
    @movie_id = movie_id
    @errors = []
    @movies = []
  end

  def call
    @errors, @movies = TheMoviesDatabaseApi.similar_movies(@movie_id)

    @movies = success? ? @movies.map { |m| setup_movie(m) }.slice(0, 4) : []

    self
  end
end
