class MovieFavoriteList < ApplicationRecord
  belongs_to :movie
  belongs_to :favorite_list

  validates :movie, uniqueness: { scope: :favorite_list }
end
