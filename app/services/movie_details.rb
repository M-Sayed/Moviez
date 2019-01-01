class MovieDetails < TheMoviesDatabaseService
  attr_reader :movie

  def initialize(movie_id)
    @movie_id = movie_id
    @errors   = []
  end

  def call
    @errors, result = TheMoviesDatabaseApi.movie_details(@movie_id)

    if success?
      @movie = setup_movie(result)
    end

    self
  end
end
