class TheMoviesDatabaseService < ApplicationService
  def setup_movie(m)
    Movie.find_by(movie_id: m[:id]) ||
      Movie.new({
        title: m[:title],
        overview: m[:overview],
        rate: m[:vote_average],
        movie_id: m[:id],
        poster_path: m[:poster_path],
        tagline: m[:tagline] || ''
      })
  end
end
