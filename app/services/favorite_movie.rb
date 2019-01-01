class FavoriteMovie < ApplicationService
  def initialize(current_user, movie_id, undo = false)
    @user     = current_user
    @movie_id = movie_id
    @errors   = []
    @undo     = undo
  end

  def call
    persist_movie unless movie.persisted?

    @movie_favorite_list = MovieFavoriteList.find_or_initialize_by(
      movie: movie,
      favorite_list: favorite_list
    )

    unless @undo
      add_to_favorite
    else
      remove_from_favorite
    end

    self
  end

  private

  def add_to_favorite
    @movie_favorite_list.save || @errors = @movie_favorite_list.errors
  end

  def remove_from_favorite
    @movie_favorite_list.destroy
  end

  def movie
    @movie ||= MovieFinder.call(@movie_id).movie
  end

  def favorite_list
    @favorite_list ||= user.favorite_list
    @favorite_list ||= user.create_favorite_list
  end

  def user
    @user
  end

  def persist_movie
    @errors << @movie.errors unless @movie.save
  end
end
