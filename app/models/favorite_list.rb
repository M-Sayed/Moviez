class FavoriteList < ApplicationRecord
  belongs_to :user
  has_many :movie_favorite_lists, dependent: :destroy
  has_many :movies, through: :movie_favorite_lists

  validates_presence_of :user
end
