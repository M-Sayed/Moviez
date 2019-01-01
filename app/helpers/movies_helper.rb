module MoviesHelper
  def favorited?(movie)
    return false unless current_user.favorite_list && movie.persisted?
    MovieFavoriteList.exists?(
      movie: movie.id,
      favorite_list: current_user.favorite_list
    )
  end
end
