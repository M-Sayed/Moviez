class MoviesSearch < TheMoviesDatabaseService
  attr_reader :movies, :page

  def initialize(query, search_page)
    @query, @search_page  = query, search_page
    @errors = []
    @movies = []
    @page   = 0
  end

  def call
    @errors, @movies, @page = TheMoviesDatabaseApi.search_movies(@query, @search_page)

    if success?
      @movies.map! { |m| setup_movie(m) }
    end

    self
  end
end
