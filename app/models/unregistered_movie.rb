class UnregisteredMovie
  attr_accessor :title, :overview, :rate, :poster_path, :movie_id

  def initialize(params)
    params.each do |k, v|
      send("#{k}=", v)
    end
  end

  def poster_url
    TheMoviesDatabaseApi.image_url(poster_path)
  end

  def to_json
    {
      title: title,
      overview: overview,
      rate: rate,
      movie_id: movie_id,
      poster_url: poster_url
    }
  end
end
