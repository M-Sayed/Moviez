class Movie < ApplicationRecord
  has_many :movie_favorite_lists, dependent: :destroy
  has_many :favorite_lists, through: :movie_favorite_lists

  validates_presence_of :movie_id, :title, :overview

  def poster_url
    TheMoviesDatabaseApi.image_url(poster_path)
  end
end
